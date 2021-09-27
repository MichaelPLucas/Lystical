class Item < ApplicationRecord
  belongs_to :list
  validates :list_id, presence: true
  validates :title, presence: true
  validates :currency, numericality: { :in => 0..999 }
end
