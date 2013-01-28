class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :id

  def initialize(attributes={})
    self.id = attributes
  end

  def persisted?
    true
  end
end