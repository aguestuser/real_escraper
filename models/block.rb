require './scrapers/block_scraper'
require './models/lot.rb'

class Block
  @@blocks = []
  attr_accessor :number, :lots

  def initialize(number)
    @number = number
    @lots = scrape_lots number
  end

  def Block.build_from_numbers(block_numbers)
    # input: array of block_numbers
    # does: tries to initialize Block object for each block_number,  
    # output: array of Block objects corresponding to subset of block_numbers that have lots
    block_numbers.each do |bn|
      block = Block.new(bn)
      @@blocks.push block unless block.lots.nil?
    end
    @@blocks
  end

  def Block.all
    @@blocks
  end

  private

    def scrape_lots(block_number)
      scraper = BlockScraper.new
      if lot_numbers = scraper.get_lot_numbers(block_number)
        lot_numbers.map { |lot_number| Lot.new(lot_number) }
      end
    end # done: scrape_lot_numbers

end