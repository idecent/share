# encoding: utf-8
class User < ActiveRecord::Base
  belongs_to :source
  has_many :share_urls
  has_many :urls, :through => :share_urls
end
