module RestfulController
  class Base
    ACTIONS = [:index, :show, :edit, :update, :create, :destroy, :new]

    def self.inject(base, actions = [])
      actions_to_include = actions_to_include(actions)
      base.class_eval do
        include Helpers
        include Filters
        actions_to_include.each do |action|
          include "RestfulController::Actions::#{action.capitalize}".constantize
        end
      end
    end

    private
      def self.actions_to_include(actions)
        if actions.empty?
          ACTIONS
        elsif actions.length == 1 && actions.first.is_a?(Hash)
          hash = actions.first
          if hash[:except]
            ACTIONS - Array(hash[:except])
          elsif hash[:only]
            Array(hash[:only])
          end
        else
          actions
        end
      end
  end
end