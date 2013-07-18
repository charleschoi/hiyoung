class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :essay_id
      t.integer :user_id
			t.integer :by_id
			t.string :by_name
			t.string :content
      t.boolean :is_view

      t.timestamps
    end
  end
end
