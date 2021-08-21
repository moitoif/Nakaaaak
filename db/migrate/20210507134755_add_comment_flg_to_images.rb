class AddCommentFlgToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :comment_flg, :bool
  end
end
