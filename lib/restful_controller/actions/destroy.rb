module RestfulController
  module Actions
    module Destroy
      def destroy
        instance_variable_get("@#{self.class.model_name}").destroy

        respond_with instance_variable_get("@#{self.class.model_name}")
      end
    end
  end
end