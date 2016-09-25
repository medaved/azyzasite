class GalleriesController < ApplicationController

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.order('position ASC')
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images.order('position ASC')
  end

end
