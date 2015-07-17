module Workspace
  class DashboardController < BasicController

    before_action :get_my_work
    before_action :init_with_tasks, :only => [:index]

    def index

      @work = Work.find_or_create_by({ :user_id => current_user.id })

      if current_user.follows?(@work) == false
        current_user.follow!(@work)
      end

      @followers = @work.followers(User)

    end

  end
end
