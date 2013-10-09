class Topic < ActiveRecord::Base
  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags
  validates :name, :presence => true
  validates :opinion, :presence => true, length: { minimum: 15 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    temp_resource = Resource.create(resource)
    self.resources << temp_resource
    temp_resource
  end

end
