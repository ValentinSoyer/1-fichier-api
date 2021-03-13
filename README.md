# UnFichierApi

UnFichierApi provide you a simple way to use the 1Fichier Api in Ruby (https://1fichier.com/api.html).

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

For beggining, you must have a 1Fichier API key and reference it in a initializer like this:

```ruby
UnFichierApi::Base.api_key = 'MY_API_KEY'
```

UnFichierApi provide you few objects that help you to call the 1Fichier API:
- File
- Folder
- Ftp
- FtpUser
- Remote
- User

Features to be develop (if you want develop it, don't hesitate):
- Upload

All methods describe below have default params listed. You should replace default params by your own. 1Fichier has their own default values, for folder_id for example. Please refer to the 1Fichier API documentation here for more informations about it: https://1fichier.com/api.html

### File object

#### Download a file
```ruby
UnFichierApi::File.download(url: nil, inline: nil, cdn: nil, restrict_ip: nil, single: nil, pass: nil, no_ssl: nil, folder_id: nil, filename: nil, sharing_user: nil)
```
**url**: (required) Url of the file   
**inline**: (optional) 0 or 1   
**cdn**: (optional) 0 or 1 for a use of your CDN credits   

Get informations of a file
```ruby
UnFichierApi::File.info(url: nil, pass: nil, folder_id: nil, filename: nil, sharing_user: nil)
```

List files of a folder
```ruby
UnFichierApi::File.list(folder_id: nil, sharing_user: nil, sent_before: nil, sent_after: nil)
```

Copy file(s) in a folder
```ruby
UnFichierApi::File.copy(urls: [], folder_id: nil, pass: nil, sharing_user: nil, rename: nil)
```

Move file(s) in a new folder
```ruby
UnFichierApi::File.move(urls: [], destination_folder_id: nil, destination_user: nil, rename: nil)
```

Rename file(s)
```ruby
UnFichierApi::File.rename(urls: [])
```

Remove file(s)
```ruby
UnFichierApi::File.remove(files: [])
```

Scan file (with 1Fichier antivirus)
```ruby
UnFichierApi::File.scan(url: nil)
```

Change attributes of file(s)
```ruby
UnFichierApi::File.change_attributes(urls: [], filename: nil, description: nil, pass: nil, no_ssl: nil, inline: nil, cdn: nil, acl: { ip: [], country: [], email: [], premium: nil })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ValentinSoyer/1-fichier-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
