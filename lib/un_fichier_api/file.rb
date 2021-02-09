# frozen_string_literal: true

module UnFichierApi
  class File < Base
    # Methods
    class << self
      def change_attributes(urls: [], filename: nil, description: nil, pass: nil, no_ssl: nil, inline: nil, cdn: nil, acl: { ip: [], country: [], email: [], premium: nil })
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('chattr'), body: body
      end

      def copy(urls: [], folder_id: nil, pass: nil, sharing_user: nil, rename: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('cp'), body: body
      end

      def download(url: nil, inline: nil, cdn: nil, restrict_ip: nil, single: nil, pass: nil, no_ssl: nil, folder_id: nil, filename: nil, sharing_user: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: 'download/get_token.cgi', body: body
      end

      def info(url: nil, pass: nil, folder_id: nil, filename: nil, sharing_user: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('info'), body: body
      end

      def list(folder_id: nil, sharing_user: nil, sent_before: nil, sent_after: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('ls'), body: body
      end

      def move(urls: [], destination_folder_id: nil, destination_user: nil, rename: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('mv'), body: body
      end

      def remove(files: [])
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('rm'), body: body
      end

      def rename(urls: [])
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('rename'), body: body
      end

      def scan(url: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('scan'), body: body
      end
    end
  end
end
