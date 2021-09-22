class User < ApplicationRecord
  has_many :list
  has_many :comment
  validates :username, presence: true
  validates :password, length: { minimum: 8 },
                       presence: true
  validates :email, presence: true
end
