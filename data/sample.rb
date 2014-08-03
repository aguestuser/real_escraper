require './block.rb'
require './lot.rb'

class Sample

  def block
    block = Block.new(1209)
    block.lots = [ 
      1,7,9,
      11,13,14,17,18,19,
      20,21,22,23,24,25,26,27,29,
      31,32,33,34,35,36,38,
      40,41,43,45,46,47,48,49,
      50,51,52,53,54,55,57,59,
      61,62,65,66,67,68,69,
      70,71,72,73,75,76,77,78
    ].map { |lot_number| Lot.new(lot_number) }
    block
  end

end