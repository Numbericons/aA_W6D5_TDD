require "tdd"

describe Array do
    let(:arr_empty) { [] }

    describe '#my_uniq' do
        subject(:arr) { [1, 2, 1, 3, 3] }

        it "returns an empty if the array is empty" do
            expect(arr_empty.my_uniq).to eq([])
        end
        
        it "returns unique values from an array" do
            expect(arr.my_uniq).to eq([1,2,3])
        end
    end

    describe '#two_sum' do
        subject(:arr) { [-1, 0, 2, -2, 1] }
        let(:arr_invalid) { [1, "sam", 2, 3] }
        
        it "returns an empty if the array is empty" do
            expect(arr_empty.two_sum).to eq([])
        end

        it "returns the correct indices" do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "returns false if an element is not an integer" do
            expect(arr_invalid.two_sum).to eq(false)
        end
    end

    describe "#my_transpose" do
        subject(:multi_arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

        it "transposes a multi dimension array" do
            expect(multi_arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        end
    end

    describe "#stock_picker" do
        subject(:arr1) { [56, 50, 69, 43, 52, 71, 39, 40] } 
        let(:arr2) { [100, 15, 50, 10, 40, 60, 5] }
        let(:arr3) { [100, 70, 50, 45, 40, 30, 5] }
       
        it "choose the most profitable days to buy(comes first) and sell" do
            expect(arr1.stock_picker).to eq([3,5])
            expect(arr2.stock_picker).to eq([3,5])
        end

        it "return an empty array if no profit is possible" do
            expect(arr3.stock_picker).to eq([])
        end
    end
end



