class Stocks
  def stock_picker(prices)
      result = []
      prices.each_with_index do |price, i|
          stocks = prices[i..]
          high = stocks.max
          high_idx = stocks.index(high) + i
          profit = [high - price, i, high_idx]
          result << profit
      end
      p result.max_by(&:first)[1..2]
  end
end

Stocks.new.stock_picker([17,3,6,9,15,8,6,1,10])