module RestfulController
  module Actions
    module Update
      def update
        instance_variable_get("@#{self.class.model_name.pluralize}").update_attributes(model_params)
      end
    end
  end
end