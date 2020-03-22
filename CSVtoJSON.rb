#!/usr/bin/env ruby

# Parse CSV files and convert them to JSON.
# Mostly used for preparing data for D3.js. I don't like using untyped
# CSV files, so this script begins to clean things up for me.

# Usage: ./parse.rb /path/to/input.csv /path/to/output.json
#ruby ~/documents/github/searchwarranty/CSVtoJSON.rb
#~/documents/github/searchwarranty/test.csv
#~/documents/github/searchwarranty/output.json

# Jason A. Heppler | jason@jasonheppler.org | jasonheppler.org
# MIT License <http://heppler.mit-license.org/>
#
# Created: 2014-07-10
#https://stackoverflow.com/questions/26402182/ruby-script-for-converting-csv-to-json
require 'rubygems'
require 'json'
require 'csv'

def is_int(str)
  # Check if a string should be an integer
  return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

lines = CSV.open(ARGV[0]).readlines
keys = lines.delete lines.first

File.open(ARGV[1], "w") do |f|
  data = lines.map do |values|
    is_int(values) ? values.to_i : values.to_s
    Hash[keys.zip(values)]
  end
  f.puts JSON.pretty_generate(data)
end
