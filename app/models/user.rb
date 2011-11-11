# encoding: utf-8
class User < ActiveRecord::Base
  belongs_to :source
  has_many :urls
end
