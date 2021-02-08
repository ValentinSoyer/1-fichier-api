# frozen_string_literal: true

module UnFichierApi
  class Folder < Base
    # Methods
    class << self
      def list(folder_id: nil, sharing_user: nil, files: nil)
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding
        call path: action_route('ls'), body: body
      end
    end
  end
end
