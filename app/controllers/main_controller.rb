class MainController < ApplicationController
  def index
    set_ng_app('parkingLineApp')
  end

  # API
  def query_nearest_line
    nearest_line = ParkingLine.find_nearest_line(params[:lat], params[:lng])

    factory = RGeo::GeoJSON::EntityFactory.instance
    feature = factory.feature nearest_line.geom

    render json: nearest_line.attributes.merge({geojson: RGeo::GeoJSON.encode(feature)})
  end
end
