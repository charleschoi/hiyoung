class CreateStences < ActiveRecord::Migration
  def change
    create_table :stences do |t|
      t.integer :user_id
      t.integer :essay_id
      t.text :content

      t.timestamps
    end
  end
end
