class Cup < ApplicationRecord
  has_many :user_cups, dependent: :destroy
  has_many :users, through: :user_cups
end
