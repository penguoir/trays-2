class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
