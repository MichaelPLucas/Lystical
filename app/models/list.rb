class List < ApplicationRecord
  belongs_to :user
  has_many :item
  has_many :comment
end
