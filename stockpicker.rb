def stock_picker(prices)
    result = []
    prices.each_with_index do |buy_val, i|
        stocks = prices[i..]
        high_val = stocks.max
        low_val = stocks.min
        highest_idx = prices[i..].each_with_index.max[1] + i
        profit = [high_val - buy_val, i, highest_idx]
        result.push(profit)
    end
    answer = result.max_by(&:first)
    p answer[1..2]
end

stock_picker([17,3,6,9,15,8,6,1,10])