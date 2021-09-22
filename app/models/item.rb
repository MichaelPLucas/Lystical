class Item < ApplicationRecord
  belongs_to :list
  validates :list_id, presence: true
  validates :title, presence: true
  validates :currency, :in => 0..999
  validates :link, presence: true
end
