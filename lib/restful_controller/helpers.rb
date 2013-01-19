module RestfulController
  module Helpers
    extend ActiveSupport::Concern

    included do
      # set_post
      define_method "set_#{model_name}" do
        model = self.class.model_class.find(params[:id])
        instance_variable_set("@#{self.class.model_name}", model)
      end
    end

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