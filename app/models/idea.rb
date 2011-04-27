class Idea < ActiveRecord::Base
  validates :title, :description, :presence => true
  
  belongs_to :user
  
  scope :all_by_newest, order('created_at DESC')
end
