require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags

  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 10 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    #resources.create(resource)
    resource[:topic_id] = self.id
    Resource.create(resource)
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic

  validates :url, format: { with: /http:\/\/[\w]+[.]\w{2,}/ }
  validates :url, presence: true
  validates :topic_id, numericality: true
  validates :topic_id, presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }


end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags

  validates :name, uniqueness: true
  validates :name, presence: true
end
