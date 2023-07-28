class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :user, null: false, foreign_key: true
      t.references :userblog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
