# UnFichierApi

UnFichierApi provide you a simple way to use the 1Fichier API with Ruby (https://1fichier.com/api.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'un_fichier_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install un_fichier_api

## Usage

To begin, you must have a 1Fichier API key and reference it in a initializer like this:

```ruby
UnFichierApi::Base.api_key = 'MY_API_KEY'
```

UnFichierApi provide you few objects that help you to call the 1Fichier API:
- [File](#file-object)
- [Folder](#folder-object)
- [Ftp](#ftp-object)
- [FtpUser](#ftp-user-object)
- [Remote](#remote-upload-object)
- [User](#user-object)

Objects to be develop in future (if you want develop it, [don't hesitate](#contributing)):
- Upload

All methods describe below have default listed params. You should replace default params by your own. 1Fichier has their own default values, for folder_id value for example.   

Please refer to the 1Fichier API documentation [here](https://1fichier.com/api.html) for all informations about API.

### File object

**Download a file**
```ruby
UnFichierApi::File.download(url: nil, inline: nil, cdn: nil, restrict_ip: nil, single: nil, pass: nil, no_ssl: nil, folder_id: nil, filename: nil, sharing_user: nil)
```
`url` : Download link   
`inline` : (optional) 0 or 1, if "inline" option enabled. You can always add "&inline=1" to the supplied url   
`cdn` : (optional) 0 or 1, if using your CDN credits (forced if Premium / Access and identified server)   
`restrict_ip` : (optional - for CDN only). 0 (default): No restriction, 1: Prohibits IP changes, 2: Prohibits any sub-requests   
`single` : (optional). 0 (default) : Child requests allowed. 1: Prohibits any sub-requests   
`pass` : (optional) Access password to the file, if restricted by password.   
`no_ssl` : (optional) Disable SSL on the download link   
`folder_id` : Folder ID (if groupware sharing with hidden download link option)   
`filename` : Filename (if groupware sharing with hidden download link option)   
`sharing_user` : Email of the user who shares his resource (essential if folder_id = 0 - if the file is at the root)

<br>

**Get informations about a file**
```ruby
UnFichierApi::File.info(url: nil, pass: nil, folder_id: nil, filename: nil, sharing_user: nil)
```
`url`: (required) Url of the file   
`pass` : (optional) Access password to the file, if restricted by password. Options, if it's a groupware shared folder file with the hidden download link feature.   
`folder_id` : Folder ID   
`filename` : Filename (exact/case sensitive)   
`sharing_user` : Email of the account that shares the folder (useful if root folder / folder_id=0)

<br>

**List files of a folder**
```ruby
UnFichierApi::File.list(folder_id: nil, sharing_user: nil, sent_before: nil, sent_after: nil)
```
`folder_id` : (optional) Folder identifier. Root if unspecified or 0. -1 allow to list all files of the account   
`sharing_user` : (optional) Email of the user sharing his folder - used if folder_id = 0 / root folder sent_before/sent_after : (optional) Allow to limit the return by date (can be used separately or not)   
`sent_before/sent_after` : (optional) Limit the result by date. Params can be combined or not.

<br>

**Copy file(s) in a folder**
```ruby
UnFichierApi::File.copy(urls: [], folder_id: nil, pass: nil, sharing_user: nil, rename: nil)
```
`urls` : List (array) of files (download links) to copy. Copy all the files whose access is not restricted to you.   
`folder_id` : Identifier of target folder / destination (0 or not specified if root).   
`pass` : Access password (optional)   
`sharing_user` : Email of the user sharing his destination resource (used if folder_id = 0 or empty)   
`rename` : (optional) Rename the file (works with 1 URL only)

<br>

**Move file(s) in a new folder**
```ruby
UnFichierApi::File.move(urls: [], destination_folder_id: nil, destination_user: nil, rename: nil)
```
`urls` : List (array) of files (download links) to move. Allows you to move only your own files or files to which you have write access (groupware shares).   
`destination_folder_id` : Identifier of the target folder (Root of your account if "0." Must be defined.).   
`destination_user` : Email of the user sharing his destination resource (used if destination_folder_id = 0 or empty)   
`rename` : (optional) Rename the file (works with 1 URL only)

<br>

**Rename file(s)**
```ruby
UnFichierApi::File.rename(urls: [])
```
`urls` : List (array) of files (download links) to rename. Only works with the account files (see example below).   
```ruby
urls: [
  { url: 'https://1fichier.com/my_example', filename: 'my_filename' }
]
```

<br>

**Remove file(s)**
```ruby
UnFichierApi::File.remove(files: [])
```
`files` : List (array) of files (download links) to remove. Precise a code for the files not linked to an account (optional). See example below.   
```ruby
files: [
  { url: 'https://1fichier.com/my_example', code: 'my_code' }
]
```

<br>

**Scan file (with 1Fichier antivirus)**
```ruby
UnFichierApi::File.scan(url: nil)
```
`url`: (required) url of the file to scan.   

<br>

**Change attributes of file(s)**
```ruby
UnFichierApi::File.change_attributes(urls: [], filename: nil, description: nil, pass: nil, no_ssl: nil, inline: nil, cdn: nil, acl: { ip: [], country: [], email: [], premium: nil })
```
`urls` : List (array) files (download links) to edit. You can act on your files as well as the files to which you are authorized in write mode   
`filename` : Change the file name. Only works with a single file   
`description` : Modify the description of the file(s) (may be empty)   
`pass` : Change the access password. 6 characters minimum. (may be empty to remove)   
`no_ssl` : Force default access without SSL encryption   
`inline` : Forces "inline" access, informs the browser of the content-type and does not force the opening of a download box.   
`cdn` : Flag the files in "CDN".   
`acl` : Advanced access controls. Can be empty to remove   
`acl/ip` : List of IPs to allow. CIDR format.   
`acl/country` : List of countries to allow   
`acl/email` : List of registered users emails to allow   
`acl/premium` : Only allow our customers (Premium / Access)

### Folder object

**List folders**
```ruby
UnFichierApi::Folder.list(folder_id: nil, sharing_user: nil, files: nil)
```
`folder_id` : Identifier of the folder. Root if unspecified or 0.   
`sharing_user` : Email of the user who shares the folder (mandatory if sharing the root folder - ignored otherwise)   
`files` : (optional) : Add files list of the folder

<br>

**Create a folder**
```ruby
UnFichierApi::Folder.create(name: nil, folder_id: nil, sharing_user: nil)
```
`name`: Folder name   
`folder_id` : Identifier of the parent folder. Root if unspecified or 0.   
`sharing_user` : (optional) Email of the user sharing a folder (required if groupware sharing the root folder)

<br>

**Move a folder**
```ruby
UnFichierApi::Folder.move(folder_id: nil, destination_folder_id: nil, destination_user: nil, rename: nil)
```
`folder_id` : Folder ID to move (source)   
`destination_folder_id` : Destination folder ID (root if "0")   
`destination_user` : User email (used in the case of a groupware share with destination_folder_id = 0)   
`rename` : New name for the folder (ignore destination_*)

<br>

**Remove a folder**
```ruby
UnFichierApi::Folder.remove(folder_id: nil)
```
`folder_id` : Folder ID to remove   

<br>

**Share a folder**
```ruby
UnFichierApi::Folder.share(folder_id: nil, share: nil, pass: nil, shares: [])
```
`folder_id` : Folder ID   
`share` : If public sharing accessible via URL like https://1fichier.com/dir/abdef   
`pass` : If "share", possibility to set an access password (6 characters minimum)   
`shares` : Groupware shares with other registered users (0 or empty array to remove any groupware share)   
`shares/email` : Registered user email address   
`shares/rw` : If allow in write mode   
`shares/hide_links` : Hide download links (implies shares/rw = 0)

### Ftp object

**Processing request to upload your files in FTP**
```ruby
UnFichierApi::Ftp.process
```

### Ftp user object

**List the FTP users**
```ruby
UnFichierApi::FtpUser.list
```

<br>

**Create a FTP user**
```ruby
UnFichierApi::FtpUser.create(user: nil, pass: nil, folder_id: nil)
```
`user` : (required) Username   
`pass` : (required) Password   
`folder_id` : (optional) Destination folder identifier when upload files

<br>

**Remove a FTP user**
```ruby
UnFichierApi::FtpUser.remove(user: nil)
```
`user` : (required) Username

### Remote upload object

**List the remote uploads**
```ruby
UnFichierApi::Remote.list
```

<br>

**Info about a remote upload request**
```ruby
UnFichierApi::Remote.info(id: nil)
```
`id` : Remote upload request identifier identifier

<br>

**Create a remote upload request**
```ruby
UnFichierApi::Remote.request(urls: [], folder_id: nil, headers: {})
```
`urls` : List (array) of files (download links) to upload to the account.   
`folder_id` : Destination folder (root if empty or "0")   
`headers/name` : Alphanumeric characters accepted, including '-'. Insensitive to the box according to the RFC. We will normalize the variable in lowercase except for the first letter of words (eg Content-Type)   
`headers/value` : Accepted alphanumeric characters, including space, tab (excluding the first and last characters) [-_+=%?,'"/]

Example of `headers` value :
```ruby
headers: {
  'Name1': 'my_value_1',
  'Name2': 'my_value_2'
}
```

### User object

**Get/update informations about the user**
```ruby
UnFichierApi::User.info(ftp_mode: nil, ftp_did: nil, ftp_report: nil, ru_report: nil, default_domain: nil, page_limit: nil, default_port: nil, default_port_files: nil, use_cdn: nil, download_menu: nil)
```
`ftp_mode` : Mode of treatment of files uploaded by FTP. 0/automatic - 1/manual   
`ftp_did` : Destination folder ID of files uploaded by FTP (default root/0)   
`ftp_report` : Send a notification email after processing files uploaded by FTP.   
`ru_report` : Sending a notification email after processing a Remote Upload request.   
`default_domain` : Default file hosting domain (see table).   
`page_limit` : Limit the number of files show on a page (web interface)   
`default_port` : Default download port. 0/HTTP SSL - 1/HTTP   
`default_port_files` : Default download port for your files. 0/HTTP SSL - 1/HTTP   
`use_cdn` : Use your CDN credits for your own downloads.   
`download_menu` : Display the download menu

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ValentinSoyer/1-fichier-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
