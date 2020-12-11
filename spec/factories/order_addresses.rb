FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市南区' }
    block { '大字10-592' }
    building { '東マンション１０１' }
    phone_number { '00011112222' }
    user_id { 1 }
    item_id { 1 }
  end
end
