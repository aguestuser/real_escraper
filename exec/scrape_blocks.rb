#!/usr/bin/env ruby

require './models/block.rb'
require './models/lot.rb'
require './scrapers/block_scraper.rb'

def block_numbers
  (1199..1477) # all of Crown Heights
end

puts "INITIALIZING: Beginning to build Block objects"
Block.build_many(block_numbers)
puts "COMPLETE: All Block objects initialized"

puts "INITIALIING: Begining to srape blocks for lot numbers"
Block.scrape_all_lots!
puts "COMPLETE: All blocks scraped for lot numbers; all Lot objects initialized."

Block.print_all_to_json
puts "SCRIPT COMPLETE: All data written to json. 
  You may view the results at #{Block.printer.file_path}"