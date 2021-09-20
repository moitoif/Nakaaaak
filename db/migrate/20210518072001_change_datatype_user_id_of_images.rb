class ChangeDatatypeUserIdOfImages < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :user_id, 'bigint USING CAST(user_id AS bigint)'
  end
end
