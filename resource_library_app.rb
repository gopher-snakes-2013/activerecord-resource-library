require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  validates :name, :opinion, presence: true
  validates :opinion, length: { minimum: 10 }


  has_many :resources

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end
end

class Resource < ActiveRecord::Base
  validates :url, presence: true, format: { with: /http:\/\/.*/, message: "Only valid URL allowed"}
  validates :topic_id, numericality: true

  belongs_to :topic
end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
