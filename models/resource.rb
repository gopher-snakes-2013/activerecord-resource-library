require_relative '../spec/spec_helper'

class Resource < ActiveRecord::Base
  belongs_to :topic

end
