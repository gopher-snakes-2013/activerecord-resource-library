class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, :presence => true

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end

end
