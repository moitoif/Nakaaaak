class AddFileNameToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :filename, :string
  end
end
