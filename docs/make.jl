using Documenter
using GoogleDrive

makedocs(
         
         sitename="GoogleDrive",
         modules =[GoogleDrive],
          pages = [
        "Home" => "index.md",
        "Features" => "features.md",
        
    ],
    )

deploydocs(repo = "github.com/tejasvaidhyadev/GoogleDrive.jl.git",
           target = "build",
           branch = "gh-pages",
           latest = "mater",
           osname = "linux"
    push_preview = true,
)

