# frozen_string_literal: true

module UnFichierApi
  class Folder < Base
    # Methods
    class << self
      def list(**args)
        authorized_params = [:folder_id, :sharing_user, :files]
        body = body_from_parameters parameters: method(__method__).parameters, method_binding: binding, authorized_params: authorized_params

        call path: action_route('ls'), body: body
      end
    end
  end
end
