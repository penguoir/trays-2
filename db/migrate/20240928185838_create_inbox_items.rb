class CreateInboxItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inbox_items do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.boolean :done, null: false, default: false
      t.boolean :pinned, null: false, default: false

      t.timestamps
    end
  end
end
