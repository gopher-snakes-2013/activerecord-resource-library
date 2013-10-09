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
    # p '*' * 100
    # p tag.id
    # p self.id
    # self.topic_tags << tag.id

    TopicTag.create(:topic_id => self.id, :tag_id => tag.id)

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
  validates :topic_id, uniqueness: { scope: :tag_id }

end

class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags

  validates :name, uniqueness: true
  validates :name, presence: true
end
