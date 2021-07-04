class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.bigint :image_id
      t.bigint :comment_user_id
      t.bigint :x
      t.bigint :y

      t.timestamps
    end
  end
end
