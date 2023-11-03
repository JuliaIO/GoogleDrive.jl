using GoogleDrive
using Test

@testset "GoogleDrive.jl" begin

    dst = "https://docs.google.com/uc?export=download&id=XYZ"
    @test google_download_url("https://drive.google.com/file/d/XYZ") == dst
    @test google_download_url("https://drive.google.com/file/d/XYZ/view") == dst
    @test google_download_url(dst) == dst

    src = "https://docs.google.com/spreadsheets/d/XYZ/edit"
    dst = "https://docs.google.com/spreadsheets/d/XYZ/export?format="
    @test google_download_url(src) == dst * "csv"
    @test GoogleDrive.sheet_download_url(src, "xlsx") == dst * "xlsx"

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
