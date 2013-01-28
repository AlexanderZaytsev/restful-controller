module RestfulController
  module Actions
    module Create
      def create
        model = self.class.model_class.build(model_params)
        instance_variable_set("@#{self.class.model_name}", model)
        if model.save
          # binding.pry
          redirect_to model, notice: "#{self.class.model_name} was successfully created."
        else
          render action: 'new'
        end
      end
    end
  end
end