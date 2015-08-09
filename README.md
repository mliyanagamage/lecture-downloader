# Lecture Downloader

A script to download lecture files from the CECS public site.

## How To Use

Edit the `config.js` file and customize it to your liking. The details are specified below

```
{
  "config_name": "Lecture Downloader Config File", // Title, can ignore
  "version": 1, // version, config file may change in new release
  "properties": {
    "url": "http://cs.anu.edu.au/student/comp4610/notes/", // url to download form
    "destination": "/Users/Migara/dev/comp4610/lectures", // directory to store the downloads
    "whitelist": [
      "pdf" // array of strings of file extensions which should be downloaded
    ],
    "blacklist": [] // array of strings of file extensions which should be ignored
  }
}

```

Once these paramters are set, simply run the script and the files will be downloaded to the specified directory.


## Dependencies

Requires the following gems:

- nokogiri
- open-uri

Run the command `bundle install` to install the required dependencies.

## Special Thanks

Special thanks to [Darren Bishop](https://github.com/dbishop1) for the idea to create this script. He will not be using this one since he has an irrational hatred of Ruby and so has created his own in ugly, ugly Bash. But thank you nevertheless.