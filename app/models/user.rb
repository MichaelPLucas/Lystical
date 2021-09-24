class User < ApplicationRecord
  has_many :list
  has_many :comment
  validates :username, presence: true
  validates :password, presence: true,
                       length: { minimum: 8 }
  validates :password, confirmation: { case_sensitive: true }
  validates :email, presence: true,
                    uniqueness: true
end
