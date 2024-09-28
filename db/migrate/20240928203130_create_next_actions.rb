class CreateNextActions < ActiveRecord::Migration[8.0]
  def change
    create_table :next_actions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: true, foreign_key: true
      t.text :body, null: false
      t.boolean :done, null: false, default: false

      t.timestamps
    end
  end
end
