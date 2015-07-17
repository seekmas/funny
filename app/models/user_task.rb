class UserTask < ActiveRecord::Base
	belongs_to :user_task_catalog

	belongs_to :task_type

	attr_accessor :expired_at_format

  def expired_at_format=(expired_at_format)
    @expired_at_format = expired_at_format
  end

  def expired_at_format

    if self.expired_at == nil
    	@expired_at_format = ""
    else
    	@expired_at_format = self.expired_at.strftime("%Y.%m.%d") 
    end

  end

end
