# Lecture Downloader

A script to download lecture files from a website.

## How To Use

Edit the script add add or modify the following paramters.

- `@url` - the url to download the files from
- `@whitelist` - a whitelist of the files to download, for example only download pdf files
- `@blacklist` - a blacklist to ignore certain files, for example don't download pdf with 16 slides per page
- `@destination` - where to store the files downloaded

Once these paramters are set, simply run the script and the files will be downloaded to the specified directory.


## Dependencies

Requires the following gems:

- nokogiri
- open-uri

## Special Thanks

Special thanks to Darren Bishop for the idea to create this script. He will not be using this one since he has an irrational hatred of Ruby and so has created his own in ugly, ugly Bash. But thank you nevertheless.


## Future

- [ ] Add a Gemfile
- [ ] More Easy Configuration
- [ ] Something else I think of