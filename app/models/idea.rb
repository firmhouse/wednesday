class Idea < ActiveRecord::Base
  validates :title, :description, :presence => true
  
  scope :all_by_newest, order('created_at DESC')
end
