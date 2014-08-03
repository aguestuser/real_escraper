#input: Array of Location.block_numbers
#side-effects:
  # look up all properties on ACRIS, parse data and persist to DB
  # look up principals of all shell firms
  # geocode property addresses(?)
#output: 
  # Array of Properties with:
    # Property attributes (incl. :deeds, :mortgages, @zoning, @far, :violations)
    # owned_by_shell
  # Array of Owners with:
    # has_many_properities
    # has_more_properites_than(Int)
    # biggest_property_holders_limit(Int)
    # biggest_property_holders_within(Int, PolygonCoords)


class Main
  Sraper.new(block_numbers).properties
  l_principals Property.owned_by_shell

end

class ShellShucker
  def initialize(properites)
    
  end

end

home = .new(
  block: 01209,
  lot: 0050

)


class AcrisScraper
  def initialize(block_numbers)
    @properties = get_properties block_numbers
    @properties.each(&:save)
  end

  def 
    
  end

  private

    def get_properties(block_numbers)
      #input: Array of block_numbers
      #output: Array of Properties
      block_numbers.each.map do |block_number|
        120.times do |n|
          results_page = page_if_results block_number, n
          parse results_page, n unless results_page.nil?
        end
      end      
    end

    def page_if_results(block_number, lot_number)
      # crawl for property
      # visit http://a836-acris.nyc.gov/CP/LookUp/Index
      # fill in 
      if has_result?
        result
      else
        nil
      end
      
    end

    def parse(page) #input: Page, #output: Property
      deeds = []
      mortgages = []

      rows = page.css('table table tr')
      header_row = rows[0]
      data_rows = rows.drop 0
      data_rows.each do |row|
        if row.children[].inner_text.include? 'DEED'
          
        end
      end


      deeds = get_deeds(page)
      mortgages = get_mortgages(page)
      property = Property.new(deeds, mortgages)
    end

    def get_deeds(page)
      deeds = []
      deeds.push(Deed.new())
      
    end
end