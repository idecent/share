# encoding: utf-8
class Url < ActiveRecord::Base
  belongs_to :source
  belongs_to :user
end
