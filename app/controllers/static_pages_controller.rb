class StaticPagesController < ApplicationController
  respond_to :html, :js

  def create
    @user = User.create( params[:user] )
  end

  def home
    @users = User.all
    @user = User.new
    @invitation = Invitation.new
    @room = Room.new
    @conversation = Conversation.new
  end


  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
