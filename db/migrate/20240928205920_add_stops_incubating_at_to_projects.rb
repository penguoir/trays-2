class AddStopsIncubatingAtToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :incubating_until, :string
    add_column :projects, :stops_incubating_at, :date
  end
end
