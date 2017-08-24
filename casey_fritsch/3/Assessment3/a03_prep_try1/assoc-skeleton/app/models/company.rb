class Company < ActiveRecord::Base

  :price

  belongs_to :watch_lists,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: "WatchList"
  #
  # has_many :watchers,
  # through: :watch_lists,
  # source:

  has_one :board,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: "Board"

  belongs_to :exchange,
  primary_key: :id,
  foreign_key: :exchange_id,
  class_name: "Exchange"

end
