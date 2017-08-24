class Link < ActiveRecord::Base
  validates :user, :title, :url, presence: true

  has_many :comments
  belongs_to :user 
end
