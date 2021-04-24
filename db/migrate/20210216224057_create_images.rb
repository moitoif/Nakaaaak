class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.string :user_id
      t.string :content

      t.timestamps
    end
  end
end
