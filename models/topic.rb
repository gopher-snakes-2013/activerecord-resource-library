class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, :presence => true
  validates :opinion, :presence => true, length: { minimum: 15 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end

end
