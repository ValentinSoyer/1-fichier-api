# frozen_string_literal: true

module UnFichierApi
  module Helpers
    module RequestHelper
      extend ActiveSupport::Concern

      class_methods do
        def action_route(action_name)
          "#{self.name.demodulize.underscore}/#{action_name}.cgi"
        end

        def body_from_parameters(parameters:, method_binding:, authorized_params:)
          body = Hash[parameters.map do |type, arg|
            if type == :keyrest
              args = method_binding.local_variable_get(arg)
              args.reject { |k, v| authorized_params.exclude? k }.map { |k, v| [k, v] }
            else
              next if authorized_params.exclude? arg
              [arg, method_binding.local_variable_get(arg)]
            end
          end.flatten(1)]

          body.reject { |k, v| v.blank? }
        end
      end
    end
  end
end
