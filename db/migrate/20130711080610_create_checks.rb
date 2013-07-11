class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :topic_id
      t.integer :essay_id
      t.integer :comment_id
      t.integer :user_id
      t.boolean :viewed

      t.timestamps
    end
  end
end
