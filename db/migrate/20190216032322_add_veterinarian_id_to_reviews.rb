class AddVeterinarianIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :veterinarian_id, :integer
  end
end
