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
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :url, presence: true
  validates :topic_id, numericality: true, presence: true
  validates :difficulty, inclusion: { in: [:easy, :medium, :hard] }

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
