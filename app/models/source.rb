class Source < ActiveRecord::Base
  has_many :users
  has_many :urls
end
