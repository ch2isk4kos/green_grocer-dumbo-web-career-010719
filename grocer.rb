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
