class Api::V1::LinksController < Api::V1::BaseController
  def update
    @link = Link.find(params[:id])
    @link.update_status(params[:update])
    @link.save
  end
end
