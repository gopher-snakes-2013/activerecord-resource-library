class Resource < ActiveRecord::Base
  belongs_to :topic

  validates_format_of :url, :with => URI::regexp(%w(http https))

end
