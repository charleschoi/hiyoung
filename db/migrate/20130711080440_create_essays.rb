class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.integer :user_id
      t.integer :topic_id
			t.string :username
			t.text :summary
      t.text :content
			t.boolean :is_view

      t.timestamps
    end
  end
end
