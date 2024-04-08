var documenterSearchIndex = {"docs":
[{"location":"features/#functions","page":"Features","title":"functions","text":"","category":"section"},{"location":"features/#google_download","page":"Features","title":"google_download","text":"","category":"section"},{"location":"features/","page":"Features","title":"Features","text":"google_download(URL, IO)","category":"page"},{"location":"features/","page":"Features","title":"Features","text":"Download a file from Google Drive or Google Sheets.","category":"page"},{"location":"features/#Example","page":"Features","title":"Example","text":"","category":"section"},{"location":"features/","page":"Features","title":"Features","text":"Downloading a ZIP file from Drive using the google_download function","category":"page"},{"location":"features/","page":"Features","title":"Features","text":"julia> google_download(\"https://drive.google.com/file/d/0B9w48e1rj-MOLVdZRzFfTlNsem8/view\", \"file.zip\")\n\"/home/iamtejas/Downloads/file.zip\"","category":"page"},{"location":"features/#google*download*url","page":"Features","title":"googledownloadurl","text":"","category":"section"},{"location":"features/","page":"Features","title":"Features","text":"Convert a direct Google Drive / Google Sheets URL to the direct download form.","category":"page"},{"location":"features/#Example-2","page":"Features","title":"Example","text":"","category":"section"},{"location":"features/","page":"Features","title":"Features","text":"julia> google_download_url(\"https://drive.google.com/file/d/0B9w48e1rj-MOLVdZRzFfTlNsem8/view\")\n\"https://docs.google.com/uc?export=download&id=0B9w48e1rj-MOLVdZRzFfTlNsem8\"","category":"page"},{"location":"methods/#Methods-list","page":"Methods","title":"Methods list","text":"","category":"section"},{"location":"methods/","page":"Methods","title":"Methods","text":"","category":"page"},{"location":"methods/#Methods-usage","page":"Methods","title":"Methods usage","text":"","category":"section"},{"location":"methods/","page":"Methods","title":"Methods","text":"Modules = [GoogleDrive]","category":"page"},{"location":"methods/#GoogleDrive.drive_download_url-Tuple{AbstractString}","page":"Methods","title":"GoogleDrive.drive_download_url","text":"drive_download_url(url::AbstractString)::String\n\nConvert a GoogleDrive URL of the form https://drive.google.com/file/d/XYZ to the form needed for raw data download: https://docs.google.com/uc?export=download&id=XYZ\n\n\n\n\n\n","category":"method"},{"location":"methods/#GoogleDrive.google_download-Tuple{AbstractString, Union{Base.AbstractCmd, AbstractString, IO}}","page":"Methods","title":"GoogleDrive.google_download","text":"google_download(url::AbstractString, location::Union{AbstractString,AbstractCmd,IO})\n\nDownload data from Google URL url into location, returning location.\n\nlocation can be of any type that Downloads.download accepts - so a file path, a command, or an IO buffer.\n\n\n\n\n\n","category":"method"},{"location":"methods/#GoogleDrive.google_download_url-Tuple{AbstractString}","page":"Methods","title":"GoogleDrive.google_download_url","text":"google_download_url(url::AbstractString)\n\nConvert a direct Google Drive/Sheets URL to a direct download URL. The resulting URL can be used with Downloads, DataDeps or any other data fetching package.\n\n\n\n\n\n","category":"method"},{"location":"methods/#GoogleDrive.sheet_download_url","page":"Methods","title":"GoogleDrive.sheet_download_url","text":"sheet_download_url(url::AbstractString, format)::String\n\nConvert a Google Sheets URL of the form https://docs.google.com/spreadsheets/d/XYZ/edit to the form needed for raw data download: https://docs.google.com/spreadsheets/d/XYZ/export?format=FORMAT\n\n\n\n\n\n","category":"function"},{"location":"#GoogleDrive.jl-Documentation","page":"Home","title":"GoogleDrive.jl Documentation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"  Pages = [\"features.md\"]\n  Depth=4","category":"page"},{"location":"#Preface","page":"Home","title":"Preface","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This manual is designed to get you started using GoogleDrive.jl Package in Julia.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package can be installed by cloning git repo in .julia/dev/","category":"page"},{"location":"","page":"Home","title":"Home","text":"~/.julia/dev> git clone <fork_repo_URL>","category":"page"},{"location":"#Getting-Started","page":"Home","title":"Getting Started","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"In all of the examples that follow, we'll assume that you have the TextAnalysis package fully loaded. This means that we think you've implicitly typed","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using GoogleDrive","category":"page"},{"location":"","page":"Home","title":"Home","text":"before every snippet of code.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}
