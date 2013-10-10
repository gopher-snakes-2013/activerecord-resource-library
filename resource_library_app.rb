require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 10 }

  has_many :resources
  has_many :topic_tags
  has_many :tags, through: :topic_tags

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource) 
    # resource[:topic_id] = self.id
    # Resource.create!(resource)

    self.resources.create(resource)
    # self.resources << Resource.create(resource) => won't pass rspec test because of topic_id validation, but would work for assigning topic_id
  end
end

class Resource < ActiveRecord::Base
  belongs_to :topic

  validates :url, presence: true, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[.\!\/\\w]*))?)/ }
  validates :topic_id, numericality: true, presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }

end

class TopicTag < ActiveRecord::Base
  belongs_to :topic
  belongs_to :tag
end

class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags
end

