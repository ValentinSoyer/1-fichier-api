# frozen_string_literal: true

module UnFichierApi
  class Ftp < Base
    # Methods
    class << self
      def process
        call path: action_route('process')
      end
    end
  end
end
