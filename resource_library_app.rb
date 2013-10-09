require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class Topic < ActiveRecord::Base
  has_many :resources
  validates :name, presence: true

  def tag_with!(tag)
    # IMPLEMENT ME
  end

  def add_resource!(resource)
    # IMPLEMENT ME
  end
end

class Resource < ActiveRecord::Base

end

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
