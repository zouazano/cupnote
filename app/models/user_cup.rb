class UserCup < ApplicationRecord
  belongs_to :user
  belongs_to :cup
  has_many :likes, dependent: :destroy
end
