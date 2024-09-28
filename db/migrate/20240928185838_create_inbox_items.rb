class CreateInboxItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inbox_items do |t|
      t.text :body, null: false
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
