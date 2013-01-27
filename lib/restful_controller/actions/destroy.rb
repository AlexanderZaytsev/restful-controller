module RestfulController
  module Actions
    module Destroy
      def destroy
        instance_variable_get("@#{self.class.model_name}").destroy
      end
    end
  end
end