module Api
  class WorkTasksController < ApplicationController
    before_action :set_work_task, only: [:show, :edit, :update, :destroy]
    skip_before_filter :verify_authenticity_token

    # GET /work_tasks
    # GET /work_tasks.json
    def index
      @work_tasks = WorkTask.where(:user_id => current_user.id).order(:before_task_days => :desc).all
    end

    # GET /work_tasks/1
    # GET /work_tasks/1.json
    def show
    end

    # GET /work_tasks/new
    def new
      @work_task = WorkTask.new
    end

    # GET /work_tasks/1/edit
    def edit
    end

    # POST /work_tasks
    # POST /work_tasks.json
    def create
      @work_task = WorkTask.new(work_task_params)
      @work_task.user_id = current_user.id

      if @work_task.save
        render :json => @work_task
      else
        render json: @work_task.errors
      end
    end

    # PATCH/PUT /work_tasks/1
    # PATCH/PUT /work_tasks/1.json
    def update
      if @work_task.update(work_task_params)
        render :json => @work_task
      else
        render :json => @work_task.errors
      end
    end

    # DELETE /work_tasks/1
    # DELETE /work_tasks/1.json
    def destroy
      @work_task.destroy

      render :json => { :response => "成功删除任务" }
      respond_to do |format|
        format.html { redirect_to work_tasks_url, notice: 'Work task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_task
        @work_task = WorkTask.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def work_task_params
        params.require(:work_task).permit(:task_title, :work_id, :expired_at, :task_description, :work_category_id, :task_type_id, :people_work_for, :notification_list)
      end
  end
end
