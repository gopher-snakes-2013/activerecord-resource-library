require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/resource'
require_relative 'models/topic'
# require_relative 'models/topic_tag'
# require_relative 'models/tag'

set :database, 'sqlite3:///db/resource_library.sqlite3'

class TopicTag < ActiveRecord::Base

end

class Tag < ActiveRecord::Base

end
