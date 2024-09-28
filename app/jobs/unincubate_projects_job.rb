class UnincubateProjectsJob < ApplicationJob
  queue_as :default

  # Runs every 5 minutes, checks if any projects should be unincubated and updates them.

  def perform
    Project.requiring_unincubation.each do |project|
      project.unincubate
    end
  end
end
