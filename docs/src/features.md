## functions

### drive_download
   `drive_download(URL, localdir)`


Download flie from Google drive.
The above function only Download file from google drive.
Downloading CSV file from  google_drive using google_download function
#### Example
```
julia>drive_download("https://drive.google.com/file/d/0B9w48e1rj-MOLVdZRzFfTlNsem8/view")
┌ Info: Downloading
│   source = "https://drive.google.com/file/d/0B9w48e1rj-MOLVdZRzFfTlNsem8/view"
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

### sheet_handler
   `sheet_handler(long_url)`

Provide URL that can be use as link for registering in Datadeps

### google_download
   `google_download(URL, localdir)`

It can also be consider as "maybe google download function"    
The function can be used to download file from google-drive,google-sheets or HTTP download method 
#### Example
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
