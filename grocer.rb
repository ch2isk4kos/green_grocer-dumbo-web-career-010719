# def consolidate_cart(cart)
#     # code here
#     cart.each do |item|
#         item.each do |keys, values|
#             keys.each
#
#
# end

def consolidate_cart(cart)
  result = {}
  # code here	  # code here
  cart.each_with_index do |item, i|
    item.each do |food, info|
      if result[food]
        result[food][:count] += 1
      else
        result[food] = info
        result[food][:count] = 1
      end
    end
  end
  result
end

# def consolidate_cart(cart)
#   # code here
#   new_hash = {}
#   cart.each do |item|
#     item.each do |food, item|
#       item[:count] = 0
#       item[:count] += 1
#       new_hash[food] = item
#     end
#   end
#     new_hash
# end

def apply_coupons(cart, coupons)
    # code here
end

def apply_clearance(cart)
    # code here
end

def checkout(cart, coupons)
    # code here
end
