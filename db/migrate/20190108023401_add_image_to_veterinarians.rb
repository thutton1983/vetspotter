class AddImageToVeterinarians < ActiveRecord::Migration[5.2]
  def change
    add_column :veterinarians, :image, :string
  end
end
