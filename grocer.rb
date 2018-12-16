def consolidate_cart(cart)
    new_hash = {}

    cart.each_with_index do |item|
        item.each do |food, value|
            if new_hash[food]
                new_hash[food][:count] += 1
            else
                new_hash[food] = value
                new_hash[food][:count] = 1
            end
        end
    end
    new_hash
end

# def consolidate_cart(cart)
#     new_hash = Hash.new 0
#
#     cart.each do |hash|
#         hash.each do |food, description|
#             if new_hash.has_key?(food) == false
#                 new_hash[food] = description
#                 new_hash[food][:count] = 1
#             elsif new_hash.has_key?(food)
#                 new_hash[food][:count] +=1
#             end
#         end
#     end
#     new_hash
# end



def apply_coupons(cart, coupons)
    # code here
    cart.keys.each do |item|
        coupons.each do |coupon|
            if item == coupon[:item] && cart[item][:count] >= coupon[:num]
                cart[item][:count] -= coupon[:num]
                if cart["#{coupon[:item]} W/COUPON"]
                    cart["#{coupon[:item]} W/COUPON"][:count] += 1
                else
                    cart["#{coupon[:item]} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[item][:clearance], :count => 1}
                end
            end
        end
    end
    cart
end

# def apply_coupons(cart, coupons)
#   # code here
#   result = {}
#   cart.each do |food, info|
#       coupons.each do |coupon|
#           if food == coupon[:item] && info[:count] >= coupon[:num]
#               info[:count] =  info[:count] - coupon[:num]
#               if result["#{food} W/COUPON"]
#                   result["#{food} W/COUPON"][:count] += 1
#               else
#                   result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
#               end
#           end
#       end
#       result[food] = info
#     end
#     result
# end

def apply_clearance(cart)
    # code here
    cart.values.each do |item|
        if item[:clearance] == true
            item[:price] = (item[:price] * 0.8).round(2)
        end
    end
    cart
end

def checkout(cart, coupons)
  # code here	  total = 0
end 	  consolidated = consolidate_cart(cart: cart)
  coupons_applied = apply_coupons(cart: consolidated, coupons: coupons)
  clearance_applied = apply_clearance(cart: coupons_applied)
  clearance_applied.each do |item|
    total += item[1][:price] * item[1][:count]
  end
  if total > 100
    total = total * 0.9
  else
    total
  end
  total
end
