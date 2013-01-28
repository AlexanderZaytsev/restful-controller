module RestfulController
  module Actions
    module Destroy
      def destroy
        instance_variable_get("@#{self.class.model_name}").destroy
        redirect_to send("#{self.class.model_name.pluralize}_url")
      end
    end
  end
end