module RestfulController
  module Actions
    module Show
      def show
        respond_with instance_variable_get("@#{self.class.model_name}")
      end
    end
  end
end