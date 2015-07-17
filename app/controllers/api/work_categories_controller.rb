module Api
  class WorkCategoriesController < ApplicationController
    before_action :set_work_category, only: [:show, :edit, :update, :destroy]

    # GET /work_categories
    # GET /work_categories.json
    def index
      @work = Work.find_or_create_by({ :user_id => current_user.id })
      @work_categories = WorkCategory.where(:work_id => @work.id).all
    end

    # GET /work_categories/1
    # GET /work_categories/1.json
    def show
    end

    # GET /work_categories/new
    def new
      @work_category = WorkCategory.new
    end

    # GET /work_categories/1/edit
    def edit
    end

    # POST /work_categories
    # POST /work_categories.json
    def create
      @work_category = WorkCategory.new(work_category_params)

      respond_to do |format|
        if @work_category.save
          format.html { redirect_to @work_category, notice: 'Work category was successfully created.' }
          format.json { render :show, status: :created, location: @work_category }
        else
          format.html { render :new }
          format.json { render json: @work_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /work_categories/1
    # PATCH/PUT /work_categories/1.json
    def update
      respond_to do |format|
        if @work_category.update(work_category_params)
          format.html { redirect_to @work_category, notice: 'Work category was successfully updated.' }
          format.json { render :show, status: :ok, location: @work_category }
        else
          format.html { render :edit }
          format.json { render json: @work_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /work_categories/1
    # DELETE /work_categories/1.json
    def destroy
      @work_category.destroy
      respond_to do |format|
        format.html { redirect_to work_categories_url, notice: 'Work category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_category
        @work_category = WorkCategory.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def work_category_params
        params.require(:work_category).permit(:name, :project_id, :is_allowed)
      end
  end
end
