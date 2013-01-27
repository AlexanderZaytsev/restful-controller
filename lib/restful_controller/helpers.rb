module RestfulController
  module Helpers
    extend ActiveSupport::Concern

    def model_params
      send("#{self.class.model_name}_params")
    end

    module ClassMethods
      def model_name
        controller_name.classify.downcase
      end

      def model_class
        controller_name.classify.constantize
      end
    end
  end
end