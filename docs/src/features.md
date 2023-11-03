## functions

### google_download

`google_download(URL, IO)`

Download a file from Google Drive or Google Sheets.

#### Example

Downloading a ZIP file from Drive using the `google_download` function
```
julia> google_download("https://drive.google.com/file/d/0B9w48e1rj-MOLVdZRzFfTlNsem8/view", open("file.zip", "w"))
"/home/iamtejas/Downloads/file.zip"

```
