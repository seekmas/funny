module Api
  class InviteLettersController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :set_invite_letter, only: [:show, :edit, :update, :destroy]

    # GET /invite_letters
    # GET /invite_letters.json
    def index
      @invite_letters = InviteLetter.all
    end

    # GET /invite_letters/1
    # GET /invite_letters/1.json
    def show
    end

    # GET /invite_letters/new
    def new
      @invite_letter = InviteLetter.new
    end

    # GET /invite_letters/1/edit
    def edit
    end

    # POST /invite_letters
    # POST /invite_letters.json
    def create
      @user = current_user ? current_user.id : User.all.first
      @invite_letter = InviteLetter.find_or_create_by({ :user_id => @user.id })


      if @invite_letter.update(invite_letter_params)
        render :json => @invite_letter
      else
        render json: @invite_letter.errors
      end

    end

    # PATCH/PUT /invite_letters/1
    # PATCH/PUT /invite_letters/1.json
    def update
      @user = current_user ? current_user.id : User.all.first
      @invite_letter = InviteLetter.find_or_create_by({ :user_id => @user.id })
      if @invite_letter.update(invite_letter_params)
        #render :json => @invite_letter
        render :json => current_user
      else
        render :json => @invite_letter.errors
      end
      return
    end

    # DELETE /invite_letters/1
    # DELETE /invite_letters/1.json
    def destroy
      @invite_letter.destroy
      respond_to do |format|
        format.html { redirect_to invite_letters_url, notice: 'Invite letter was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_invite_letter
        @invite_letter = InviteLetter.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def invite_letter_params
        params.require(:invite_letter).permit(:user_id, :email_list, :email_content)
      end
  end
end
