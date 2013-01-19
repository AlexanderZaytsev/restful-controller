module RestfulController
  module Actions
    module Create
      def create
        self.class.model_class.create(model_params)
      end
    end
  end
end