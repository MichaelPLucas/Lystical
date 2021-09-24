class List < ApplicationRecord
  belongs_to :user
  has_many :item
  has_many :comment
  validates :user_id, presence: true
  validates :title, presence: true
  validates :visibility, inclusion: { in: [ true, false ] }
end
