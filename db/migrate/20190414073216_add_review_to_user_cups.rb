class AddReviewToUserCups < ActiveRecord::Migration[5.2]
  def change
    add_column :user_cups, :review, :text
    add_column :user_cups, :value, :float
  end
end
