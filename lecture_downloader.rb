#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

@whitelist = [ "pdf" ]
@blacklist = []
@destination = "./test"
@url = "http://cs.anu.edu.au/student/comp4610/notes/"

contents = Nokogiri::HTML(open(@url))

pdf = Array.new

contents.css('a').map do |link|
  
  target = link.attributes["href"].value
  
  if @whitelist.any? { |w| target.include? w }
    pdf << target unless @blacklist.any? { |b| target.include? b }
  end
end

pdf.each do |file|
  `wget #{@url}#{file} --directory-prefix=#{@destination}` unless File.exist?("#{@destination}/#{file}")
end