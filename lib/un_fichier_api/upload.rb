# frozen_string_literal: true

module UnFichierApi
  class Upload < Base
    # Methods
    class << self
      def get_server
        call path: action_route('get_upload_server'), method: :get
      end

      def upload()
      end

      def end()
      end
    end
  end
end
