require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base

  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags

  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 15 }

  def tag_with!(tag)
    TopicTag.create(:topic_id => self.id, :tag_id => tag.id)
  end

  def add_resource!(resource)
    resource[:topic_id] = self.id
    Resource.create(resource)
  end
end

class Resource < ActiveRecord::Base

  belongs_to :topic

  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :topic_id, numericality: true, presence: true
  validates_inclusion_of :difficulty, :in => [:easy, :medium, :hard]

end

class TopicTag < ActiveRecord::Base

  belongs_to :topic
  belongs_to :tag

  validates :topic_id, uniqueness: { scope: :tag_id }
  # validates :tag_id, uniqueness: { scope: :topic_id }

end

class Tag < ActiveRecord::Base

  has_many :topic_tags
  has_many :topics, through: :topic_tags

  validates :name, presence: true, uniqueness: true


end
