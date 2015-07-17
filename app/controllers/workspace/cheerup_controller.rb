module Workspace
  class CheerupController < BasicController
    skip_before_action :verify_authenticity_token

    before_action :authenticate_user!, :except => [:index, :join, :upload, :photos]
    before_action :get_my_work, :except => [:index, :join, :upload, :photos]
    before_action :init_with_tasks, :except => [:index, :join, :upload, :photos]

    def index
      @work = Work.find_by({ :uuid => params[:wedding_code] })
      @galleries = WorkGallery.where({ :work_id => @work.id }).all
      render :layout => 'lottery'
    end

    def join
      @work = Work.find_by({ :uuid => params[:wedding_code] })
      @galleries = WorkGallery.where({ :work_id => @work.id }).all
      @gallery = WorkGallery.new
      if params[:work_gallery]
        if WorkGallery.find_by({ :phone => params[:work_gallery][:phone], :work_id => @work.id }) == nil
          @gallery.work_id = @work.id
          @gallery.is_lucky = false
          @gallery.update(gallery_params)
          @gallery.save
          flash[:message] = "拍照上传成功 谢谢你的支持跟祝福 ^_^"
        else
          flash[:message] = "你已经参加了抽奖"
        end
        redirect_to cheerup_join_path(@work.uuid)
        return
      end
      render :layout => 'cheerup'
    end

    def photos
      @work = Work.find_by({ :uuid => params[:wedding_code] })
      @work_galleries = WorkGallery.where({ :work_id => @work.id }).all
      render :layout => 'clean'
    end

    def get_phones
      @work = Work.find_by({ :uuid => params[:wedding_code] })
      @galleries = WorkGallery.where({ :work_id => @work.id }).all

      render :layout => "clean"
    end


    protected
    def gallery_params
      params.require(:work_gallery).permit(:phone, :photo)
    end

  end
end
