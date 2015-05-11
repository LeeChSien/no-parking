class ParkingLine < ActiveRecord::Base
  # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:geom, RGeo::Geographic.spherical_factory(:srid => 4326))

  def self.find_nearest_line(lat, lng)
    ParkingLine.order("ST_Distance(geom, 'SRID=4326;POINT(#{lng} #{lat}) ASC')").first
  end
end
