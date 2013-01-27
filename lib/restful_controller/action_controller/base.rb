module ActionController
  class Base
    def self.restful_controller(*actions)
      RestfulController::Base.inject(self, *actions)
    end
  end
end