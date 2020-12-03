FactoryBot.define do
  factory :buyer_info do
    token             {"tok_abcdefghijk00000000000000000"}
    postal_code       {"144-1212"}
    prefecture_id     {4}
    municipality      {"出雲市小山町"}
    address           {"257-6"}
    building_name     {"コーポアイエム201"}
    phone_number      {"09012341234"}
    association :user
    association :item
  end
end
