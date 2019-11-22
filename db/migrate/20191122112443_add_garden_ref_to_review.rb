class AddGardenRefToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :garden, foreign_key: true
  end
end
