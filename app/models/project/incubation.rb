class Project
  module Incubation
    extend ActiveSupport::Concern

    class_methods do
      def requiring_unincubation
        where("stops_incubating_at < ?", Time.current)
      end
    end

    def unincubate
      update!(stops_incubating_at: nil, incubating_until: nil)
      user.inbox_items.create!(
        body: "Project #{name} is no longer incubating. <a href=\"/projects/#{id}\">View project</a>."
      )
    end
  end
end
