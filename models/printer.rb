  class Printer

    attr_reader :file_path

    def initialize(datetime, env, classname, records)
      case env 
      when :production
        date_pretty = datetime.strftime('on %m/%d/%Y at %l:%M%p')
        date_ugly = datetime.strftime("_%Y%m%d%H%M")
        sandwich_meat = classname.downcase+'s'+date_ugly
      when :test
        date_pretty = "on 01/01/1999"
        sandwich_meat = "_test_#{classname.downcase}s"
      end
      
      @file_path = "./data/#{sandwich_meat}.json"
      @comment = "//#{classname} data scraped from ACRIS #{date_pretty}\n\n"
      @records = records

      def print
        jsonArr = @records.map(&:get_hash)
        json = JSON.pretty_generate jsonArr
        File.open( @file_path, 'w' ) { |f| f.write(@comment + json) }        
      end
    end
  end