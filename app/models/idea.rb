class Idea < ActiveRecord::Base
  validates :title, :description, :presence => true
end
