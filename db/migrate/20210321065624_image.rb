class Image < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :answer_flg, :boolean, defalut: 'false'
  end
end
