require_relative '../../intercom'
require_relative '../send_event'
require_relative '../update_user'

module Lucid
  module Intercom
    module Events
      class Uninstalled < Base
        def call
          Lucid::Intercom::UpdateUser.new(shop_attributes, {plan: nil}).()
          Lucid::Intercom::SendEvent.new(shop_attributes).(event_name, event_metadata)
        end

        #
        # @return [String]
        #
        private def event_name
          "#{Lucid::Intercom::APP_PREFIX}_uninstalled"
        end

        #
        # @return [Hash]
        #
        private def event_metadata
          {
            company_id: shop_attributes['myshopify_domain']
          }
        end
      end
    end
  end
end
