class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = current_user.links.new(link_params)
    @link.save
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:name, :url)
  end
end
