class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.bigint :comment_id

      t.timestamps
    end
  end
end
