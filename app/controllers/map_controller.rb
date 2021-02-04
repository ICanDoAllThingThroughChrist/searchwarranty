class MapController < ApplicationController
  layout "map"
  def index
    render 'index.html'
  end
  def map_data
    @stations = GisSwmdList.all
  end

end
