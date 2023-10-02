using Documenter
using GoogleDrive

makedocs(
    modules = [GoogleDrive],
    sitename = "GoogleDrive.jl",
    pages = [
     "Home" => "index.md",
     "Features" => "features.md",
    ],
)

deploydocs(
    repo = "github.com/JuliaIO/GoogleDrive.jl.git",
    devbranch = "master",
    target = "build",
    branch = "gh-pages",
#   latest = "master",
#   osname = "linux"
    devurl = "dev",
    versions = ["stable" => "v^", "dev" => "dev"],
    forcepush = true,
    push_preview = true,
)
