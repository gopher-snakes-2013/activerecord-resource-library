require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources

  validates :name, presence: true
  validates :opinion, presence: true, length: { minimum: 10 }

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
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

end
