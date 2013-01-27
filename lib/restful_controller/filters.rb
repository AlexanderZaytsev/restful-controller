module RestfulController
  module Filters
    extend ActiveSupport::Concern
    included do
      # set_post
      define_method "set_#{model_name}" do
        model = self.class.model_class.find(params[:id])
        instance_variable_set("@#{self.class.model_name}", model)
      end

      append_before_filter "set_#{model_name}", only: [:show, :edit, :update, :destroy]
    end
  end
end