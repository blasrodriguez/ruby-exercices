def stock_picker prices_stock
  best_price=0
  trade_days=[]
  prices_stock.each_with_index do | buy_price, index | 
    prices_stock[index..-1].each_with_index do | sell_price, second_index| 
      if sell_price - buy_price > best_price
        best_price = sell_price - buy_price
        trade_days[0]= index
        trade_days[1] = second_index + index
      else
      end
    end
  end
p trade_days
end

stock_picker([17,3,6,9,15,8,6,1,10])
