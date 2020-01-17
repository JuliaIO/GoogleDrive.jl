# GoogleDrive


[![Build Status](https://travis-ci.com/tejasvaidhyadev/GoogleDrive.jl.svg?branch=master)](https://travis-ci.org/tejasvaidhyadev/GoogleDrive.jl)


## Introduction
GoogleDrive.jl provides support for downloading files from Google-Drive on top of Datadeps.

### Installation
The package can be installed by cloning git repo in .julia/dev/
```julia
~/.julia/dev> git clone <fork_repo_URL>
```


## Details

### drive_download
   `drive_download(URL, localdir)`


Download flie from Google drive.
The above function only Download file from google drive.

### sheet_handler
   `sheet_handler(long_url)`

Provide URL that can be use as link for registering in Datadeps

### google_download
   `google_download(URL, localdir)`

It can also be consider as "maybe google download function"    
The function can be used to download file from google-drive,google-sheets or HTTP download method 

## Configuration
This package is build on top of [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).
To configure, e.g., where downloaded files save to, and read from (and to understand how that works),
see the DataDeps.jl readme.

## Examples

Load the package with

```
julia> using GoogleDrive
```

### Loading different Embeddings

Downloading CSV file from  google_drive using google_download function
```
julia>google_download("https://docs.google.com/spreadsheets/d/1tbNIGxnp8wLk31DIMNPD_Hi_CmIdpdTPfzMUDcs1xE/edit#gid=0","/home/iamtejas/Downloads")
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
### Reference 

Code:-
[Peter Cheng](https://github.com/chengchingwen/Transformers.jl/blob/master/src/datasets/download_utils.jl) 
