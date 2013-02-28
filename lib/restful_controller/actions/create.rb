module RestfulController
  module Actions
    module Create
      def create
        model = self.class.model_class.new(model_params)
        instance_variable_set("@#{self.class.model_name}", model)

        model.save

        respond_with instance_variable_get("@#{self.class.model_name}")
      end
    end
  end
end