require './models/jsonable'

class Lot
  include JSONable
  attr_accessor :number

  def initialize(number)
    @number = number
  end
end