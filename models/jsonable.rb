module JSONable
  module ClassMethods
      
  end
  
  module InstanceMethods
    def obj_to_json
      #input: Object with nested Objects
      #does: recursively translates Object and all nested Objects to JSON
      #output: JSON String
      hash = self.get_hash # START RECURSION
      JSON.pretty_generate hash
    end

    def get_hash
      hash = {}
      self.instance_variables.each do |var|
        key = var.to_s.delete '@'
        value = get_value_from var
        hash[key] = value
      end
      hash
    end

    # def obj_from_json! string
    #   JSON.load(string).each do |var, val|
    #       self.instance_variable_set var, val
    #   end
    # end
    
    private 

      def get_value_from var
        value = self.instance_variable_get var
        if value.class.name == 'Array'
          value.map{ |value| get_base_value_from value } 
        else 
          get_base_value_from value
        end
      end

      def get_base_value_from value
        if ['Lot', 'Block'].include? value.class.name
          value.get_hash # RECURSE
        else
          value # BASE CASE (end recursion)
        end
      end

  end
  
  def self.included receiver
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
  end
end