module RestfulController
  module Actions
    module Index
      def index
        instance_variable_set("@#{self.class.model_name.pluralize}", self.class.model_class.all)
      end
    end
  end
end