module RestfulController
  module Actions
    module Index
      def index
        instance_variable_set("@#{self.class.model_name.pluralize}", self.class.model_class.all)

        respond_with instance_variable_get("@#{self.class.model_name.pluralize}")
      end
    end
  end
end