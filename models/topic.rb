require_relative '../spec/spec_helper'

class Topic < ActiveRecord::Base
  has_many :resources

end
