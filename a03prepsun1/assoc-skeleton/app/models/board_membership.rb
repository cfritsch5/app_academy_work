class BoardMembership < ActiveRecord::Base

  #board
  belongs_to :board,
  class_name: "Board",
  foreign_key: :board_id,
  primary_key: :id

  belongs_to :member,
  class_name: "Executive",
  foreign_key: :member_id,
  primary_key: :id
end
