# frozen_string_literal: true

module UnFichierApi
  class File < Base
    # Methods
    class << self
      def list(**args)
        authorized_params = [:folder_id, :sharing_user, :sent_before, :sent_after]
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding, authorized_params: authorized_params

        call path: action_route('ls'), body: body
      end

      def download(**args)
        authorized_params = [:url, :inline, :cdn, :restrict_ip, :single, :pass, :no_ssl, :folder_id, :filename, :sharing_user]
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding, authorized_params: authorized_params

        call path: 'download/get_token.cgi', body: body
      end
    end
  end
end
