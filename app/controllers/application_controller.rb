class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::UnknownAction, :with => :render_404
  rescue_from Errno::ECONNREFUSED, :with => :render_500
  
  def render_404
    return if performed?
    respond_to do |format|
      format.html {render :template => 'page/404', :status => 404}
      format.xml {render :template => 'page/404', :status => 404}
    end
  end

  def render_500
    return if performed?
    respond_to do |format|
      format.html {render :file => "#{Rails.root.to_s}/public/500.html", :layout => false, :status => 500}
      format.mobile {render :file => "#{Rails.root.to_s}/public/500.html", :layout => false, :status => 500}
    end
  end
end
