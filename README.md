# GoogleDrive
Download files from Google Drive.

https://github.com/JuliaIO/GoogleDrive.jl

[![action status][action-img]][action-url]
[![pkgeval status][pkgeval-img]][pkgeval-url]
[![codecov][codecov-img]][codecov-url]
[![license][license-img]][license-url]
[![docs-stable][docs-stable-img]][docs-stable-url]
[![docs-dev][docs-dev-img]][docs-dev-url]

[![Build Status](https://travis-ci.com/JuliaIO/GoogleDrive.jl.svg?branch=master)](https://travis-ci.org/JuliaIO/GoogleDrive.jl/)


## Introduction

GoogleDrive.jl provides support for downloading files from Google Drive,
directly as an IO stream,
or on top of
[DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).


### Installation
Install the package using the
[julia package manager](https://julialang.github.io/Pkg.jl/v1/managing-packages/#Adding-packages-1):

Open the REPL, press <kbd>]</kbd> to enter package mode, and then:

```julia
pkg> add GoogleDrive
```


## Details

Some of the methods in this package
may no longer be needed
because of changes to Google Drive API.

To download data into an IO stream from a special URL of the form
`url = "https://docs.google.com/uc?export=download&id=1GqmszfSB_LHGQEQpSjoiPyDROZ5a8Ls4"`,
use the following code:

```julia
using Downloads: download
io = IOBuffer()
download(url, io)
str = String(take!(io)) # (this line for text data only)
```

To download data from a typical Google Drive URL of the form
`url = "https://drive.google.com/file/d/1GqmszfSB_LHGQEQpSjoiPyDROZ5a8Ls4"`,
use the following code
that converts the URL internally for convenience:

```julia
using GoogleDrive: google_download
io = IOBuffer()
google_download(url, io)
str = String(take!(io)) # (this line for text data only)
```


### drive_download
   `drive_download(URL, localdir)`

Download file from Google drive.
The above function only Download file from google drive.


### sheet_handler
   `sheet_handler(long_url)`

Provide URL that can be use as link for registering in Datadeps


### google_download
   `google_download(URL, localdir)`

It can also be consider as "maybe google download function"
The function can be used to download a file from
google-drive, google-sheets or HTTP download method.


## Configuration
This package is build on top of
[DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).
To configure, e.g., where downloaded files save to, and read from
(and to understand how that works),
see the DataDeps.jl readme.


## Examples

Load the package with

```
julia> using GoogleDrive
```

### Loading different Embeddings

Downloading CSV file from GoogleDrive using `google_download` function
```
julia> google_download("https://docs.google.com/spreadsheets/d/1tbNIGxnp8wLk31DIMNPD_Hi_CmIdpdTPfzMUDcs1xE/edit#gid=0", "/home/iamtejas/Downloads")
┌ Info: Downloading
│   source = "https://docs.google.com/spreadsheets/d/1tbNI-Gxnp8wLk31DIMNPD_Hi_CmIdpdTPfzMUDcs1xE/export?format=csv"
│   dest = "/home/iamtejas/Downloads/InternshipsToApplyFor-Sheet1.csv"
│   progress = NaN
│   time_taken = "0.05 s"
│   time_remaining = "NaN s"
│   average_speed = "84.961 KiB/s"
│   downloaded = "4.163 KiB"
│   remaining = "∞ B"
└   total = "∞ B"
"/home/iamtejas/Downloads/InternshipsToApplyFor-Sheet1.csv"

```

## Contributing and Reporting Bugs

Contributions, in the form of bug-reports, pull requests, additional documentation are encouraged. They can be made to the Github repository.

**All contributions and communications should abide by the
[Julia Community Standards](https://julialang.org/community/standards/).**


### Reference

Code:-
[Peter Cheng](https://github.com/chengchingwen/Transformers.jl), [HTTPS](https://github.com/JuliaWeb/HTTP.jl)


<!-- URLs -->
[action-img]: https://github.com/JuliaIO/GoogleDrive.jl/workflows/CI/badge.svg
[action-url]: https://github.com/JuliaIO/GoogleDrive.jl/actions
[build-img]: https://github.com/JuliaIO/GoogleDrive.jl/workflows/CI/badge.svg?branch=master
[build-url]: https://github.com/JuliaIO/GoogleDrive.jl/actions?query=workflow%3ACI+branch%3Amaster
[pkgeval-img]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/G/GoogleDrive.svg
[pkgeval-url]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/G/GoogleDrive.html
[codecov-img]: https://codecov.io/github/JuliaIO/GoogleDrive.jl/coverage.svg?branch=master
[codecov-url]: https://codecov.io/github/JuliaIO/GoogleDrive.jl?branch=master
[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://JuliaIO.github.io/GoogleDrive.jl/stable
[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://JuliaIO.github.io/GoogleDrive.jl/dev
[license-img]: https://img.shields.io/badge/license-MIT-brightgreen.svg
[license-url]: LICENSE
