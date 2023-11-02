module GoogleDrive

using DataDeps
using Dates: now, Millisecond
using Downloads: download
using Random: randstring
using HTTP

export drive_download
export sheet_handler
export google_download


"
    google_download_url(url::AbstractString)::String
Convert a GoogleDrive URL of the form
`https://drive.google.com/file/d/XYZ`
to the form needed for raw data download:
`https://docs.google.com/uc?export=download&id=XYZ`
"
function google_download_url(url::AbstractString)
    old = "https://drive.google.com/file/d/"
    new = "https://docs.google.com/uc?export=download&id="
    startswith(url, old) || startswith(url, new) ||
        throw(ArgumentError("Unknown URL form $url"))
    return replace(url, old => new)
end


"""
    google_download(url::AbstractString, io::IO)
Download data from Google URL `url` into `io`, returning `io`.

This mutates `io` so arguably it should be named `google_download!`,
but `Downloads.download` also mutates an `IO` argument
so we follow its convention.
"""
function google_download(url::AbstractString, io::IO)
    url = google_download_url(url)
    return download(url, io)
end


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

end # Module
