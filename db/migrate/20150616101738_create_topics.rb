class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :sticky
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
