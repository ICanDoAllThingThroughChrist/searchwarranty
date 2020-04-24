class MapController < ApplicationController
  layout "map"
  def index; end
  def map_data
    @stations = GisSwmdList.all
  end

end
