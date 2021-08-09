class AddCommentImageIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment_image_id, :bigint
  end
end
