module GoogleDrive

using Downloads: download

export google_download

"""
    google_download(url::AbstractString, io::IO)
Download data from Google URL `url` into `io`, returning `io`.

This mutates `io` so arguably it should be named `google_download!`,
but `Downloads.download` also mutates an `IO` argument
so we follow its convention.
"""
function google_download(url::AbstractString, io::IO)
    if is_drive_url(url)
        url = drive_download_url(url)
    elseif is_sheet_url(url)
        url = sheet_download_url(url)
    else
        throw(ArgumentError("Unknown URL form $url"))
    end
    return download(url, io)
end

is_sheet_url(url) = occursin("docs.google.com/spreadsheets", url)

const _drive_pattern = r"^https?:\/\/drive\.google\.com\/file\/d\/([^\/]*).*"
is_drive_url(url) = occursin(_drive_pattern, url) || occursin("docs.google.com/uc", url)

"
    drive_download_url(url::AbstractString)::String
Convert a GoogleDrive URL of the form
`https://drive.google.com/file/d/XYZ`
to the form needed for raw data download:
`https://docs.google.com/uc?export=download&id=XYZ`
"
function drive_download_url(url::AbstractString)
    full_url = s"https://docs.google.com/uc?export=download&id=\1"
    return replace(url, _drive_pattern => full_url)
end

function sheet_download_url(url::AbstractString, format="csv")
    link, action = splitdir(url)
    if !startswith(action, "export")
        url = link * "/export?format=$format"
    end
    return url
end

end # Module
