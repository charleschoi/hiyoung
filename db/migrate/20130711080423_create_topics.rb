class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
			t.string :username
      t.text :content
			t.integer :count

      t.timestamps
    end
  end
end
