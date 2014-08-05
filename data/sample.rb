require './models/block.rb'
require './models/lot.rb'

class Sample

  def blocks
    [ block, second_block] 
  end

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

  def second_block
    block = Block.new(1210)
    block.lots = [
      1,2,3,4,5,6,7,8,9,10,
      11,12,13,14,15,16,17,18,19,
      20,21,22,23,24,25,26,27,28,29,
      30,31,32,33,34,35,36,37,38,39,
      40,41,42,43,44,45,46,47,48,49,
      50,51,52,53,54,55,56,57,58,59,
      60,61,62,63,64,65,66,67,68,69,
      70,71,72,73,74
    ].map { |lot_number| Lot.new(lot_number)}
    block
  end

  def blocks_json_file
    "//Block data scraped from ACRIS on 01/01/1999\n\n" + blocks_json
  end

  def blocks_json
    hash_arr = [block_hash, second_block_hash]
    JSON.pretty_generate(hash_arr)
  end

  def block_json
    JSON.pretty_generate block_hash
  end

  def second_block_json
    JSON.pretty_generate second_block_hash
  end

  def block_hash
    {
      number: 1209,
      lots: [
        {
          number: 1,
        },
        {
          number: 7,
        },
        {
          number: 9,
        },
        {
          number: 11,
        },
        {
          number: 13,
        },
        {
          number: 14,
        },
        {
          number: 17,
        },
        {
          number: 18,
        },
        {
          number: 19,
        },
        {
          number: 20,
        },
        {
          number: 21,
        },
        {
          number: 22,
        },
        {
          number: 23,
        },
        {
          number: 24,
        },
        {
          number: 25,
        },
        {
          number: 26,
        },
        {
          number: 27,
        },
        {
          number: 29,
        },
        {
          number: 31,
        },
        {
          number: 32,
        },
        {
          number: 33,
        },
        {
          number: 34,
        },
        {
          number: 35,
        },
        {
          number: 36,
        },
        {
          number: 38,
        },
        {
          number: 40,
        },
        {
          number: 41,
        },
        {
          number: 43,
        },
        {
          number: 45,
        },
        {
          number: 46,
        },
        {
          number: 47,
        },
        {
          number: 48,
        },
        {
          number: 49,
        },
        {
          number: 50,
        },
        {
          number: 51,
        },
        {
          number: 52,
        },
        {
          number: 53,
        },
        {
          number: 54,
        },
        {
          number: 55,
        },
        {
          number: 57,
        },
        {
          number: 59,
        },
        {
          number: 61,
        },
        {
          number: 62,
        },
        {
          number: 65,
        },
        {
          number: 66,
        },
        {
          number: 67,
        },
        {
          number: 68,
        },
        {
          number: 69,
        },
        {
          number: 70,
        },
        {
          number: 71,
        },
        {
          number: 72,
        },
        {
          number: 73,
        },
        {
          number: 75,
        },
        {
          number: 76,
        },
        {
          number: 77,
        },
        {
          number: 78    
        }
      ]
    }
  end

def second_block_hash
    {
      number: 1210,
      lots: [
        {
          number: 1,
        },
        {
          number: 2,
        },
        {
          number: 3,
        },
        {
          number: 4,
        },
        {
          number: 5,
        },
        {
          number: 6,
        },
        {
          number: 7,
        },
        {
          number: 8,
        },
        {
          number: 9,
        },
        {
          number: 10,
        },
        {
          number: 11,
        },
        {
          number: 12,
        },
        {
          number: 13,
        },
        {
          number: 14,
        },
        {
          number: 15,
        },
        {
          number: 16,
        },
        {
          number: 17,
        },
        {
          number: 18,
        },
        {
          number: 19,
        },
        {
          number: 20,
        },
        {
          number: 21,
        },
        {
          number: 22,
        },
        {
          number: 23,
        },
        {
          number: 24,
        },
        {
          number: 25,
        },
        {
          number: 26,
        },
        {
          number: 27,
        },
        {
          number: 28,
        },
        {
          number: 29,
        },
        {
          number: 30,
        },
        {
          number: 31,
        },
        {
          number: 32,
        },
        {
          number: 33,
        },
        {
          number: 34,
        },
        {
          number: 35,
        },
        {
          number: 36,
        },
        {
          number: 37,
        },
        {
          number: 38,
        },
        {
          number: 39,
        },
        {
          number: 40,
        },
        {
          number: 41,
        },
        {
          number: 42,
        },
        {
          number: 43,
        },
        {
          number: 44,
        },
        {
          number: 45,
        },
        {
          number: 46,
        },
        {
          number: 47,
        },
        {
          number: 48,
        },
        {
          number: 49,
        },
        {
          number: 50,
        },
        {
          number: 51,
        },
        {
          number: 52,
        },
        {
          number: 53,
        },
        {
          number: 54,
        },
        {
          number: 55,
        },
        {
          number: 56,
        },
        {
          number: 57,
        },
        {
          number: 58,
        },
        {
          number: 59,
        },
        {
          number: 60,
        },
        {
          number: 61,
        },
        {
          number: 62,
        },
        {
          number: 63,
        },
        {
          number: 64,
        },
        {
          number: 65,
        },
        {
          number: 66,
        },
        {
          number: 67,
        },
        {
          number: 68,
        },
        {
          number: 69,
        },
        {
          number: 70,
        },
        {
          number: 71,
        },
        {
          number: 72,
        },
        {
          number: 73,
        },
        {
          number: 74,
        }
      ]
    }
  end




end