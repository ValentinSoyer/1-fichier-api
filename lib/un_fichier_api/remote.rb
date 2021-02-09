# frozen_string_literal: true

module UnFichierApi
  class Remote < Base
    # Methods
    class << self
      def info(id: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('info'), body: body
      end

      def list
        call path: action_route('ls')
      end

      def request(urls: [], folder_id: nil, headers: {})
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('request'), body: body
      end
    end
  end
end
