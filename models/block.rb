require './scrapers/block_scraper'
require './models/lot.rb'
require './models/jsonable.rb'
require './models/printer.rb'

class Block
  include JSONable
  attr_accessor :number, :lots

  @@blocks = []

  def initialize(block_number)
    @number = block_number
    # @lots = nil
  end

  def scrape_lots! 
    # input/prereqs: initialized Block with @number
    # does:   instantiates new BlockScraper, 
            # uses it to look up all lot numbers btw/ 1 & 100, 
            # populates @lots array with lot numbers that exist on given block
    # output: array of Lots (nil if no lot numbers found)
    scraper = BlockScraper.new
    if lot_numbers = scraper.get_lot_numbers(@number)
      @lots = lot_numbers.map { |lot_number| Lot.new(lot_number) }
    end
  end # done: scrape_lots

  # CLASS METHODS  

  def Block.build_many(block_numbers)
    block_numbers.each do |bn|
      @@blocks << Block.new(bn)
    end
    self
  end

  def Block.scrape_all_lots!
    # input: Array of all Blocks (stroed in @@blocks)
    # does: Initializes Lots for each Block and removes Blocks from @blocks that don't have any Lots
    # output: Array of all Blokcs -- with Lots added and non-Lot-having Blocks removed
    @@blocks.each do |block|
      puts "INITIALIZING: Scraping lots for BLOCK #{block.number}"
      block.scrape_lots!
    end
    @@blocks = @@blocks.reject { |block| block.lots.nil? }
  end

  def Block.print_all_to_json env=:production
    @@printer = Printer.new( DateTime.now, env, self.name, @@blocks )
    @@printer.print
    
    # @@printer.print

    # case env
    # when :production
    #   file_path = "./data/blocks#{date_str}.json"
    # when :test
    #   file_path = "./data/_test_blocks.json"
    # end
    # jsonArr = @@blocks.map(&:get_hash)
    # json = JSON.pretty_generate jsonArr
    # File.open( file_path, 'w' ) { |f| f.write json }
  end

  def Block.all
    @@blocks
  end

  def Block.all= blocks
    @@blocks = blocks
  end

  def Block.printer
    @@printer
  end

  private

    def scrape_lots(block_number)
      scraper = BlockScraper.new
      if lot_numbers = scraper.get_lot_numbers(block_number)
        lot_numbers.map { |lot_number| Lot.new(lot_number) }
      end
    end # done: scrape_lot_numbers

end