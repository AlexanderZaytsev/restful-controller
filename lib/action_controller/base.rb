class ActionController::Base
  def self.restful_controller(*actions)
    RestfulController::Base.inject(self, actions)
  end
end