module Workspace
  class CalendarController < BasicController
    
    before_action :get_my_work

    before_action :init_with_tasks, :only => [:index]

    def index
    end

  end
end
