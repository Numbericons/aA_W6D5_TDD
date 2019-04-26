require 'byebug'
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

class Towers
    attr_reader :height
    attr_accessor :pile1, :pile2, :pile3
    def initialize(height = 4)
        @pile1 = []
        @pile2 = []
        @pile3 = []
        @height = height
        height.times { |num| @pile1 << num + 1 }
    end

    def move(start = nil, end_pos = nil)
        if start.nil? || end_pos.nil?
            input = gets.chomp.to_i 
            start = input[0] 
            end_pos = input[2]
        end
        piece_in_hand = nil
        case start
        when 1 
            piece_in_hand = self.pile1.shift
        when 2
            piece_in_hand = self.pile2.shift
        when 3
            piece_in_hand = self.pile3.shift
        end

        case end_pos
        when 1 
            self.pile1.unshift(piece_in_hand)
        when 2
            self.pile2.unshift(piece_in_hand)
        when 3
            self.pile3.unshift(piece_in_hand)
        end

        game_over?
    end

    def play
        move until game_over?
    end

    def game_over?
        @pile1.empty? && (@pile2.length == self.height || @pile3.length == self.height)
    end
end
