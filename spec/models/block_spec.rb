require './models/block.rb'
require './data/sample.rb'

describe "Block" do
  let(:block){Block.new(1209)}

  subject { block }

  it { should respond_to :number }
  its(:number){ should be 1209 }
  it { should respond_to :lots }

  describe "instance methods" do
    describe "lots=" do
      before { block.lots = [1,2,3] }
      its(:lots){ should eq [1,2,3]}      
    end
    describe "scrape_lot_numbers" do
      #
    end
  end

  describe "class methods" do
    describe "build_from_numbers" do

      it "should build one Block from one valid block number" do
        expect { Block.build_from_numbers( [ 1209 ] ) }.to change(Block.all, :count).by(1) 
      end
      it "should build Block with correct contents" do
        expect( Block.build_from_numbers( [ 1209 ] )[0] ).to eq Sample.new.block
      end
      it "should build two Blocks from two valid block numbers " do
        expect { Block.build_from_numbers( [ 1209, 1210 ] ) }.to change(Block.all, :count).by(2)
      end
      it "should build one Block from one valid and one invalid block numbers" do
        expect { Block.build_from_numbers( [ 1209, 999999999 ] ) }.to change(Block.all, :count).by(1)    
      end
      it "should build zero Blocks from two invalid block numbers" do
        expect { Block.build_from_numbers( [ 111111111, 999999999 ] ) }.to change(Block.all, :count).by(0)
        # expect( Block.build_from_numbers( [ 111111111, 999999999 ] ) ).to eq []     
      end
    end
  end
end