class SitemapController < ApplicationController
  #caches_page :index
  
  def index
    @posts = Post.ordered.active

    headers['Content-Type'] = 'application/xml'
    render :layout => false
  end
end