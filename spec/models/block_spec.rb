require './models/block.rb'
require './data/sample.rb'

describe "Block" do
  let(:block){Block.new(1209)}
  let(:sample){ Sample.new }

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
      before { block.scrape_lots! }
      it "should scrape correct lots" do
        expect( Block.all[0].lots.map(&:number) ).to eq sample.block.lots.map(&:number)
      end 
    end
  end

  describe "class methods" do
    describe "scrape_all_lots!" do
      before { Block.all.clear }

      describe "with one valid Block" do
        before { Block.build_many( [ 1209 ] ).scrape_all_lots! }
        
        it "should have @@blocks array with one (correct) element" do
          expect( Block.all.count ).to eq 1
          expect( Block.all[0].number ).to eq 1209
        end

        it "should scrape correct lots" do
          expect( Block.all[0].lots.map(&:number) ).to eq Sample.new.block.lots.map(&:number)
        end
      end
      
      describe "with two valid Blocks" do
        before { Block.build_many( [ 1209, 1210 ] ).scrape_all_lots! }

        it "should have @@blocks array with two (correct) elements" do
          expect( Block.all.count ).to eq 2
          expect( Block.all.map(&:number) ).to eq [ 1209, 1210 ]
        end
      end

      describe "with one valid Block and one invalid Block" do
        before { Block.build_many( [ 1209, 999999999 ] ).scrape_all_lots! }

        it "should have @@blocks array with one (correct) element" do
          expect( Block.all.count ).to eq 1
          expect( Block.all[0].number ).to eq 1209
        end
      end

      describe "with two invalid Blocks" do
        before { Block.build_many( [ 111111111, 999999999 ] ).scrape_all_lots! }

        it "should have empty @@blocks array" do
          expect( Block.all ).to eq []
        end
      end
    end
  
    describe ".print_all_to_json" do
      before do
        Block.all= sample.blocks
        Block.print_all_to_json :test
      end
      it "should print correct data to the correct file" do
        expect( File.open("./data/_test_blocks.json", 'r') { |f| f.read } ).to eq sample.blocks_json_file      
      end
    end
  end
end