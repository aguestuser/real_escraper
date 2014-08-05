require './models/block.rb'
require './models/jsonable.rb'
require './data/sample.rb'

describe JSONable do
  let(:sample) { Sample.new }
  let(:block) { sample.block }
  let(:block_json) { sample.block_json }
  let(:other_block) { sample.other_block }
  let(:other_block_json) { sample.other_block_json }
  let(:fake_block) { Block.new(0) }

  it "should serialize object to JSON correctly" do
    expect( block.obj_to_json ).to eq block_json
  end

  # it "should construct object from JSON correctly" do
  #   expect( fake_block.from_json! other_block_json ).to eq block
  # end

end