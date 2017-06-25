class User < ActiveRecord::Base

  has_many :enrollments,
  class_name: "Enrollment"
  foreign_key: :student_id
  primary_key: :id

  #has_many :courses
  has_many :enrolled_courses
  class_name: "Course"
  foreign_key: :instructor_id
  primary_key: :id
end
