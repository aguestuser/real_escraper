require './scrapers/scraper.rb'

class BlockScraper < Scraper
  
  REQUEST_URL = 'https://a836-acris.nyc.gov/DS/DocumentSearch/BBLResult'
  ROWS_PATH = 'form table tr td table tr' 

  def get_lot_numbers(block_number)
    lot_numbers = nil

    (1..100).each do |lot_number|
      query = {
        hid_borough: 3,
        hid_borough_name: 'BROOKLYN / KINGS',
        hid_block: block_number,
        hid_block_value: block_number,
        hid_lot: lot_number,
        hid_lot_value: lot_number,
        # hid_unit: 
        hid_selectdate: 'To Current Date',
        # hid_datefromm:
        # hid_datefromd:
        # hid_datefromy:
        # hid_datetom:
        # hid_datetod:
        # hid_datetoy:
        hid_doctype: 'All Document Classes',
        hid_doctype_name: 'All Document Classes',
        hid_max_rows: 10,
        hid_page: 1,
        # hid_ReqID:
        hid_SearchType: 'BBL',
        hid_ISIntranet: 'N'
        # hid_sort:
      } 
      if response = RestClient.post(REQUEST_URL, query)
        npage = Nokogiri::HTML(response)
        rows = npage.css(ROWS_PATH)
        if rows[2].css('td')[0].text.match(/No records were found that matched your search criteria./)
          puts "  NOT FOUND: lot number #{lot_number} in block number #{block_number}."
        else
          lot_numbers ||= []
          lot_numbers.push lot_number
          puts "  FOUND: Lot number #{lot_number} in block number #{block_number}." 
        end
      else
        puts "No block found with block number #{block_number}"
      end
    end # done: (1..100).each do
    lot_numbers
  end # done: get_lot_numbers


  private

  def first_row(npage)
    npage.css(ROWS_PATH)[2]
  end
end