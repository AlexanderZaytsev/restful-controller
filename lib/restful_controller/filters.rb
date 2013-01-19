module RestfulController
  module Filters
    extend ActiveSupport::Concern
    included do
      append_before_filter "set_#{model_name}", only: [:show, :edit, :update, :destroy]
    end
  end
end