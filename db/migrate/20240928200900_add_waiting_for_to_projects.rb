class AddWaitingForToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :waiting_for, :text
  end
end
