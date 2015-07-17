require 'test_helper'

class WorkTasksControllerTest < ActionController::TestCase
  setup do
    @work_task = work_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_task" do
    assert_difference('WorkTask.count') do
      post :create, work_task: { expired_at: @work_task.expired_at, notification_list: @work_task.notification_list, people_work_for: @work_task.people_work_for, task_description: @work_task.task_description, task_title: @work_task.task_title, user_id: @work_task.user_id, work_id: @work_task.work_id }
    end

    assert_redirected_to work_task_path(assigns(:work_task))
  end

  test "should show work_task" do
    get :show, id: @work_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_task
    assert_response :success
  end

  test "should update work_task" do
    patch :update, id: @work_task, work_task: { expired_at: @work_task.expired_at, notification_list: @work_task.notification_list, people_work_for: @work_task.people_work_for, task_description: @work_task.task_description, task_title: @work_task.task_title, user_id: @work_task.user_id, work_id: @work_task.work_id }
    assert_redirected_to work_task_path(assigns(:work_task))
  end

  test "should destroy work_task" do
    assert_difference('WorkTask.count', -1) do
      delete :destroy, id: @work_task
    end

    assert_redirected_to work_tasks_path
  end
end
