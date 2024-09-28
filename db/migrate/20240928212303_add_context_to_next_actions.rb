class AddContextToNextActions < ActiveRecord::Migration[8.0]
  def change
    add_column :next_actions, :context, :string
  end
end
