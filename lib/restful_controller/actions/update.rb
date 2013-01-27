module RestfulController
  module Actions
    module Update
      def update
        if instance_variable_get("@#{self.class.model_name}").update_attributes(model_params)
          redirect_to instance_variable_get("@#{self.class.model_name}"), notice: "Was successfully updated."
        else
          render action: 'edit'
        end
      end
    end
  end
end