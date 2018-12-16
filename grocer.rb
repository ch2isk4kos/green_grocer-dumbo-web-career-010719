# def consolidate_cart(cart)
#     new_hash = {}
#
#     cart.each_with_index do |item|
#         item.each do |food, value|
#             if new_hash[food]
#                 new_hash[food][:count] += 1
#             else
#                 new_hash[food] = value
#                 new_hash[food][:count] = 1
#             end
#         end
#     end
#     new_hash
# end

def consolidate_cart(item)
    final = Hash.new 0
    # count = :count

    item.each do |hash|
        hash.each do |food, description|
            if final.has_key?(food) == false
                final[food] = description
                final[food][:count] = 1
            elsif final.has_key?(food)
                final[food][:count] +=1
            end
        end
    end
    final
end

def apply_coupons(cart, coupons)
    # code here
end

def apply_clearance(cart)
    # code here
end

def checkout(cart, coupons)
    # code here
end
