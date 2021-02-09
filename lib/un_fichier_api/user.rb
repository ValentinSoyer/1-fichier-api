# frozen_string_literal: true

module UnFichierApi
  class User < Base
    # Methods
    class << self
      def info(ftp_mode: nil, ftp_did: nil, ftp_report: nil, ru_report: nil, default_domain: nil, page_limit: nil, default_port: nil, default_port_files: nil, use_cdn: nil, download_menu: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('info'), body: body
      end
    end
  end
end
