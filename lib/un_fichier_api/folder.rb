# frozen_string_literal: true

module UnFichierApi
  class Folder < Base
    # Methods
    class << self
      def create(name: nil, folder_id: nil, sharing_user: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('mkdir'), body: body
      end

      def list(folder_id: nil, sharing_user: nil, files: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('ls'), body: body
      end

      def move(folder_id: nil, destination_folder_id: nil, destination_user: nil, rename: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('mv'), body: body
      end

      def remove(folder_id: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('rm'), body: body
      end

      def share(folder_id: nil, share: nil, pass: nil, shares: [])
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('share'), body: body
      end
    end
  end
end
