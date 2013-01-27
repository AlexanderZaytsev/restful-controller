require 'spec_helper'

describe RestfulController::Base do
  describe '.actions_to_include' do
    it 'accepts array' do
      actions = [:index, :show]
      RestfulController::Base.actions_to_include(actions).should eq([:index, :show])
    end

    it 'uses :only' do
      actions = [{only: [:index, :show]}]
      RestfulController::Base.actions_to_include(actions).should eq([:index, :show])
    end

    it 'uses :except' do
      actions = [{except: [:index]}]
      RestfulController::Base.actions_to_include(actions).should eq([:show, :edit, :update, :create, :destroy, :new])
    end
  end
end