# frozen_string_literal: true

module UnFichierApi
  class FtpUser < Base
    # Methods
    class << self
      def create(user: nil, pass: nil, folder_id: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('add'), body: body
      end

      def list
        call path: action_route('ls')
      end

      def remove(user: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('rm'), body: body
      end

      private

        def action_route(action_name)
          "ftp/users/#{action_name}.cgi"
        end
    end
  end
end
