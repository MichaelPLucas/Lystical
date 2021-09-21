class User < ApplicationRecord
  has_many :list
  has_many :comment
end
