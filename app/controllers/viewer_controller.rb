class ViewerController < ApplicationController
  def show
      @page = Page.find_by_name(params[:name])
      @subpages = @page.subpages
      authenticate_user! if @page.admin?
  end

end
