class Link < ActiveRecord::Base
  validates :user, :url, :title, presence: true

  has_many :comments
  belongs_to :user
  
end
