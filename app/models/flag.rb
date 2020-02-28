class Flag < ApplicationRecord
  belongs_to :prev_flag, class_name: "Flag", foreign_key: "flag_id", optional: true
  has_one :next_flag, class_name: "Flag"
  belongs_to :board
  has_many :captures

  has_secure_password :value

end
