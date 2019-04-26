class Array
    def my_uniq
        ret_arr = []
        self.each { |el| ret_arr << el unless ret_arr.include?(el) }
        ret_arr
    end  

    def two_sum #[-1, 0, 2, -2, 1]
        ret_arr = []
        self.each_with_index do |el, i|
            self.each_with_index do |el_in, j|
                return false unless el_in.is_a?(Integer)
                next if i >= j
                ret_arr << [i, j] if el + el_in == 0
            end
        end
        ret_arr #[[0, 4], [2, 3]]
    end

    def my_transpose #[[0, 1, 2], [3, 4, 5], [6, 7, 8]]
        ret_arr = []
        row1 = self[0]
        row2 = self[1]
        row3 = self[2]
        (0..2).each do |num| 
            ret_arr << [row1[num], row2[num], row3[num]]
            # ret_arr << [self[0][num], self[1][num], self[2][num]]
        end
        ret_arr
    end

    def stock_picker
        profit = 0
        ret_arr = []
        self.each_with_index do |num1,idx1|
            self.each_with_index do |num2,idx2|
                if idx2 > idx1 && num2 - num1 > profit
                    profit = num2 - num1
                    ret_arr = [idx1, idx2]
                end
            end
        end
        ret_arr
    end
end



# stock_prices([56, 50, 69, 43, 52, 71, 39, 40]) # buy day 5 sell day 6 
                                                 # indices [4,5] 

# stock_prices([100, 15, 50, 10, 40, 60, 5]) #[3,5] for $50