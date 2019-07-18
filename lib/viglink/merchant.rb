# frozen_string_literal: true

module Viglink
  Merchant = Struct.new(:id, :code, :group_id, :name,
                        :update_date, :create_date, :insider, :industry_types,
                        :affiliate_cpa, :affiliate_cpc, :approved, :domains,
                        :countries, :merchant_sensitive_types, :rates,
                        keyword_init: true)

  class Merchant
    SEARCH_PATH = '/api/merchant/search'

    def self.from_json(merchant = {})
      merchant['rates'] = build_from_json(Viglink::Rate, merchant['rates'])
      merchant['industryTypes'] = build_from_json(Viglink::IndustryType,
                                                  merchant['industryTypes'])
      merchant['countries'] = merchant['countries'].split(',').map(&:upcase)

      new json_map.each_with_object({}) { |(k, v), h| h[k] = merchant[v]; }
    end

    def self.search(params = {})
      response = HTTPClient.get path: SEARCH_PATH,
                                query: build_search_parameters(params)

      merchants = response.parsed_response['merchants'].map do |merchant|
        Merchant.from_json(merchant)
      end

      MerchantResults.new total_pages: response.parsed_response['totalPages'],
                          page: response.parsed_response['page'],
                          merchants: merchants
    end

    private_instance_methods

    def self.build_from_json(klass, items)
      items.map do |industry_type|
        klass.from_json(industry_type)
      end
    end

    def self.build_search_parameters(params)
      params[:page] ||= 1
      { keyword: params[:keyword], cartegory: params[:cartegory],
        updatedDate: params[:updated_date],
        createDate: params[:create_date], insider: params[:insider],
        domain: params[:domain], page: params[:page] }
    end

    def self.json_map
      {
        id: 'id', code: 'code',
        group_id: 'groupId', name: 'name',
        update_date: 'updateDate', create_date: 'createDate',
        insider: 'insider', industry_types: 'industryTypes',
        affiliate_cpa: 'affiliateCPA', affiliate_cpc: 'affiliateCPC',
        approved: 'approved', domains: 'domains',
        countries: 'countries', rates: 'rates',
        merchant_sensitive_types: 'merchantSensitiveTypes'
      }
    end
  end
  MerchantResults = Struct.new :total_pages,
                               :page,
                               :merchants,
                               keyword_init: true
end
