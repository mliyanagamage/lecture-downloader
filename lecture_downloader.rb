#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'
require 'colorize'
require 'json'

print "Welcome to Lecture Downloader\n".green
print "(c) 2015 Migara Liyanagamage\n".green
print "Source at: https://github.com/mliyanagamage/lecture-downloader\n".blue

print "\nLoading Config File\n".blue

config_json = ""
config_file = "./config.js"

if File.exists?(config_file)
  File.open(config_file) do |f|
    config_json = JSON.parse(f.read)
    print "Config File Loaded\n\n".blue
  end
else
  print "Config File Not Found!\n".red
  exit 1
end

unless config_json["version"] == 1
  print "Invalid Config file Version\n".red
  exit 1
end

properties = config_json["properties"]

@whitelist = properties["whitelist"]
@blacklist = properties["blacklist"]
@destination = properties["destination"]
@url = properties["url"]

print "Now downloading...\n\n".blue

contents = Nokogiri::HTML(open(@url))
count = 0
download_count = 0
pdf = Array.new

contents.css('a').map do |link|
  
  target = link.attributes["href"].value
  
  if @whitelist.any? { |w| target.include? w }
    pdf << target unless @blacklist.any? { |b| target.include? b }
    count += 1
  end
end

pdf.each_with_index do |file,index|
  unless File.exist?("#{@destination}/#{file}")
    print "Now Downloading #{index}/#{count}\n".yellow
    `wget #{@url}#{file} --quiet --directory-prefix=#{@destination}` 
    download_count += 1
  end
end

if download_count == 0
  print \n"No New Files Found\n".red
  exit 0
else
  print "\n#{count} files Downloaded Successfully\n".blue
end
