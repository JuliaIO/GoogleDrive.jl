module GoogleDrive
        
        using DataDeps
	using Dates
	using Random: randstring
	using HTTP 
	export drive_download
        export sheet_handler
        export google_download
"""
    unshortlink(url)
return unshorten url or the url if it is not a short link
"""



function unshortlink(url; kw...)
    rq = HTTP.request("HEAD", url; redirect=false, status_exception=false, kw...)
    while rq.status ÷ 100 == 3
        url = HTTP.header(rq, "Location")
        rq = HTTP.request("HEAD", url; redirect=false, status_exception=false, kw...)
    end
    url
end

isg_sheet(url) = occursin("docs.google.com/spreadsheets", url)
isg_drive(url) = occursin("drive.google.com", url)

function sheet_handler(url; format=:csv)
    link, expo = splitdir(url)
    if startswith(expo, "edit") || expo == ""
        url = link * "/export?format=$format"
    elseif startswith(expo, "export")
        url = replace(url, r"format=([a-zA-Z]*)(.*)"=>SubstitutionString("format=$format\\2"))
    end
    url
end

function google_download(url, localdir)
    long_url = unshortlink(url)
    if isg_sheet(long_url)

        long_url = sheet_handler(long_url)
    end

    if isg_drive(long_url)
        drive_download(long_url, localdir)
    else
        DataDeps.fetch_http(long_url, localdir)
    end
end

function find_gcode(ckj)
    for cookie ∈ ckj
        if match(r"_warning_", cookie.name) !== nothing
            return cookie.value
        end
    end

    nothing
end


function drive_download(url, localdir)
    default_ckjar = HTTP.CookieRequest.default_cookiejar
    # On newer version of HTTP.jl default_ckjar is an Array with one per thread
    ckjar = copy(default_ckjar isa Array ? default_ckjar[Base.Threads.threadid()] : default_ckjar)
    rq = HTTP.request("HEAD", url; cookies=true, cookiejar=ckjar)
    ckj = ckjar["drive.google.com"]
    gcode = find_gcode(ckj)
    @assert gcode !== nothing

    format_progress(x) = round(x, digits=4)
    format_bytes(x) = !isfinite(x) ? "∞ B" : Base.format_bytes(x)
    format_seconds(x) = "$(round(x; digits=2)) s"
    format_bytes_per_second(x) = format_bytes(x) * "/s"

    local filepath
    newurl = unshortlink("$url&confirm=$gcode"; cookies=true, cookiejar=ckjar)


    HTTP.open("GET", newurl, ["Range"=>"bytes=0-"]; cookies=true, cookiejar=ckjar) do stream
        resp = HTTP.startread(stream)
        hcd = HTTP.header(resp, "Content-Disposition")
        m = match(r"filename=\\\"(.*)\\\"", hcd)
        if m === nothing
            filename = "drive_download-$(randstring())"
        else
            filename = m.captures[]
        end

        filepath = joinpath(localdir, filename)

        total_bytes = tryparse(Float64, split(HTTP.header(resp, "Content-Range"), '/')[end])
        total_bytes === nothing && (total_bytes = NaN)
        downloaded_bytes = 0
        start_time = now()
        prev_time = now()
        period = DataDeps.progress_update_period()

        function report_callback()
            prev_time = now()
            taken_time = (prev_time - start_time).value / 1000 # in seconds
            average_speed = downloaded_bytes / taken_time
            remaining_bytes = total_bytes - downloaded_bytes
            remaining_time = remaining_bytes / average_speed
            completion_progress = downloaded_bytes / total_bytes

            @info("Downloading",
                  source=url,
                  dest = filepath,
                  progress = completion_progress |> format_progress,
                  time_taken = taken_time |> format_seconds,
                  time_remaining = remaining_time |> format_seconds,
                  average_speed = average_speed |> format_bytes_per_second,
                  downloaded = downloaded_bytes |> format_bytes,
                  remaining = remaining_bytes |> format_bytes,
                  total = total_bytes |> format_bytes,
                  )
        end


        Base.open(filepath, "w") do fh
            while(!eof(stream))
                downloaded_bytes += write(fh, readavailable(stream))
                if !isinf(period)
                  if now() - prev_time > Millisecond(1000*period)
                    report_callback()
                  end
                end
            end
        end
        report_callback()
    end
    filepath
end

end 
