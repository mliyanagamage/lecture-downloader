#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

@whitelist = [ "pdf" ]
@destination = "./test"
@url = "http://cs.anu.edu.au/student/comp4610/notes/"

contents = Nokogiri::HTML(open(@url))

pdf = Array.new

contents.css('a').map do |link|
  if @whitelist.any? { |w| link.attributes["href"].value.include? w }
    pdf << link.attributes["href"].value
  end
end

pdf.each do |file|
  `wget #{@url}#{file} --directory-prefix=#{@destination}`
end