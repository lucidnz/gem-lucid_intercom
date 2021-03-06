# frozen_string_literal: true

require_relative 'attributes_shared_examples'

module LucidIntercom
  RSpec.describe CompanyCustomAttributes do
    subject(:attributes) { CompanyCustomAttributes.new(shopify_data, plan: 'free') }

    include_fixtures 'shopify_data.yml'

    it_behaves_like 'attributes'

    describe '#to_h' do
      subject { attributes.to_h }

      it { is_expected.to include(:merchant_domain) }
      it { is_expected.to include(:merchant_myshopify_domain) }
      it { is_expected.to include(:merchant_shop_owner) }
      it { is_expected.to include(:merchant_timezone) }
      it { is_expected.to include("#{LucidIntercom.config.app_prefix}_plan" => 'free') }
    end
  end
end
