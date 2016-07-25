class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end
end
