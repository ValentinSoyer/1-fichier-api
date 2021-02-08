# frozen_string_literal: true

module UnFichierApi
  module Helpers
    module RequestHelper
      extend ActiveSupport::Concern

      class_methods do
        def action_route(action_name)
          "#{self.name.demodulize.underscore}/#{action_name}.cgi"
        end

        def body_from_parameters(parameters:, method_binding:)
          Hash[parameters.map do |type, arg|
            next if method_binding.local_variable_get(arg).nil?
            [arg, method_binding.local_variable_get(arg)]
          end.compact]
        end
      end
    end
  end
end
