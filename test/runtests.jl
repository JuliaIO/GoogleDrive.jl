using GoogleDrive: google_download, google_download_url
#using Downloads: download
using Test

@testset "GoogleDrive.jl" begin

    src = "https://drive.google.com/file/d/XYZ"
    dst = "https://docs.google.com/uc?export=download&id=XYZ"
    @test google_download_url(src) == dst
    @test google_download_url(dst) == dst
    @test_throws ArgumentError google_download_url("foo")

    #=
    The following test reads a small Julia file from GoogleDrive.
    The test will fail if that Julia file ever disappears.
    =#
    url = "https://drive.google.com/file/d/1GqmszfSB_LHGQEQpSjoiPyDROZ5a8Ls4"
    io = IOBuffer()
    google_download(url, io) # mutates io
    str = String(take!(io))
    @test str[1:2] == "#="

end
