require './scrapers/block_scraper.rb'
require './data/sample.rb'

describe "BlockScraper" do
  let(:scraper) { BlockScraper.new }
  let(:expected_lot_numbers) { Sample.new.block.lots.map(&:number) }

  describe "get_lot_numbers" do
    it "should retrieve the correct lot numbers for block 1209" do
     expect( scraper.get_lot_numbers(1209) ).to eq expected_lot_numbers
    end
  end
end