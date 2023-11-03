module GoogleDrive

using Base: AbstractCmd
using Downloads: download

export google_download, google_download_url

"""
    google_download(url::AbstractString, location::Union{AbstractString,AbstractCmd,IO})
Download data from Google URL `url` into `location`, returning `location`.

`location` can be of any type that `Downloads.download` accepts - so a file
path, a command, or an IO buffer.
"""
function google_download(url::AbstractString, location::Union{AbstractString,AbstractCmd,IO})
    url = google_download_url(url)
    return download(url, location)
end

"""
    google_download_url(url::AbstractString)
Convert a direct Google Drive/Sheets URL to a direct download
URL. The resulting URL can be used with `Downloads`, `DataDeps`
or any other data fetching package.
"""
function google_download_url(url::AbstractString)
    if is_drive_url(url)
        url = drive_download_url(url)
    elseif is_sheet_url(url)
        url = sheet_download_url(url)
    else
        throw(ArgumentError("Unknown URL form $url"))
    end
end

is_sheet_url(url) = occursin("docs.google.com/spreadsheets", url)

const _drive_pattern = r"^https?:\/\/drive\.google\.com\/file\/d\/([^\/]*).*"
is_drive_url(url) = occursin(_drive_pattern, url) || occursin("docs.google.com/uc", url)

"""
    drive_download_url(url::AbstractString)::String
Convert a GoogleDrive URL of the form
`https://drive.google.com/file/d/XYZ`
to the form needed for raw data download:
`https://docs.google.com/uc?export=download&id=XYZ`
"""
function drive_download_url(url::AbstractString)
    full_url = s"https://docs.google.com/uc?export=download&id=\1"
    return replace(url, _drive_pattern => full_url)
end

"""
    sheet_download_url(url::AbstractString, format)::String
Convert a Google Sheets URL of the form
`https://docs.google.com/spreadsheets/d/XYZ/edit`
to the form needed for raw data download:
`https://docs.google.com/spreadsheets/d/XYZ/export?format=FORMAT`
"""
function sheet_download_url(url::AbstractString, format="csv")
    link, action = splitdir(url)
    if !startswith(action, "export")
        url = link * "/export?format=$format"
    end
    return url
end

end # Module
