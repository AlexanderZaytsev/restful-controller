module RestfulController
  module Actions
    module New
      def new
        model = self.class.model_class.build
        instance_variable_set("@#{self.class.model_name}", model)
      end
    end
  end
end