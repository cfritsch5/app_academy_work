class Course < ActiveRecord::Base
  belongs_to :instructor,
  class_name: "User",
  foreign_key: :instructor_id,
  primary_key: :id

  has_many :prerequisites,
  class_name: "Courses",
  foreign_key: :prereq_id,
  primary_key: :id,
end
