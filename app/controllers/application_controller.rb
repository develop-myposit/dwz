class ApplicationController < ActionController::Base
  protect_from_forgery

 before_filter :get_pages_for_tabs
  
  def get_pages_for_tabs
    if user_signed_in?
      @tabs = Page.find_main
    else
      @tabs = Page.find_main_public
    end
  end

  def get_page_metadata
    @page = Page.find_by_name(params[:name])
    @pagetitle = @page.title
  end
end
