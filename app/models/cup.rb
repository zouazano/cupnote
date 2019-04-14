class Cup < ApplicationRecord
  has_many :user_cups, dependent: :destroy
  has_many :users, through: :user_cups
  has_many :want_cups, dependent: :destroy
  has_many :want_users, through: :want_cups, source: :user
end
