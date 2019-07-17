# frozen_string_literal: true

FactoryBot.define do
  factory :merchant, class: Viglink::Merchant do
    id { 1 }
    code { 'b088c8bb32f4b1f906e333d751d238ce' }
    group_id { 185 }
    name { 'Amazon US' }
    update_date { '2018-11-08' }
    create_date { '2009-01-01' }
    insider { true }
    industry_types { build_list(:industry_type, 1) }
    affiliate_cpa { true }
    affiliate_cpc { false }
    approved { false }
    domains { ['amazon.com', 'amazon.com.br'] }
    countries { %w[US BR] }
    merchant_sensitive_types do
      [
        'Porn', 'Search Engines', 'Loyalty',
        'Toolbars', 'Charity', 'Link Shorteners', 'Coupon'
      ]
    end
    rates { build_list(:rate, 1) }
  end
end

FactoryBot.define do
  factory :rate, class: Viglink::Rate do
    min { 7.71 }
    max { 7.71 }
    type { '%' }
    type_name { '%' }
    description { 'Calculated Rate' }
  end
end

FactoryBot.define do
  factory :industry_type, class: Viglink::IndustryType do
    code { 'CE' }
    name { 'Consumer Electronics' }
  end
end
