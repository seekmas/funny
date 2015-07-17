module Workspace
  class BasicController < ApplicationController

    before_action :authenticate_user!
    layout "work"

    def get_my_work
      @work = Work.find_or_create_by({ :user_id => current_user.id })
      if @work.uuid == nil
        @work.uuid = UUIDTools::UUID.random_create
        @work.save
      end
    end

    protected
    def init_with_tasks
      @work_categories = WorkCategory.find_by({ :work_id => @work.id })
      if @work_categories == nil
        @categories = TaskCatalog.all
        @categories.each do |category|
          new_category = WorkCategory.create({
            :name => category.catalog_name,
            :work_id => @work.id,
            :is_allowed => true
          })

          @tasks = Task.where({ :task_catalog_id => category.id })
          @tasks.each do |task|
            WorkTask.create({
              :task_title => task.task_title,
              :work_id => @work.id,
              :expired_at => nil,
              :task_description => task.task_requirement,
              :user_id => current_user.id,
              :work_category_id => new_category.id,
              :task_type_id => task.task_type_id,
              :before_task_days => task.before_task_days,
              :work_done => false
            })
          end
        end
      end
    end

  end
end
