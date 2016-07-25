class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link
    else
      flash[:errors] = @link.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end
end
