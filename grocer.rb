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
    # code here
    total = 0
    cart = consolidate_cart(cart)

    if cart.length == 1
        cart = apply_coupons(cart, coupons)
        cart_clearance = apply_clearance(cart)

        if cart_clearance.length > 1
            cart_clearance.each do |item, details|
                if details[:count] >=1
                    total += (details[:price]*details[:count])
                end
            end
        else
            cart_clearance.each do |item, details|
                total += (details[:price]*details[:count])
            end
        end
    else
        cart = apply_coupons(cart, coupons)
        cart_clearance = apply_clearance(cart)
        cart_clearance.each do |item, details|
            total += (details[:price]*details[:count])
        end
    end

    if total > 100
        total = total*(0.90)
    end
    total
end

# {
#   "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
#   "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
#   "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
# }
