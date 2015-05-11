namespace :parse do
  desc "import geojson"
  task :import_geojson => :environment do
    db_config = Rails.application.config.database_configuration[Rails.env]
    `ogr2ogr -f PostgreSQL PG:"host='#{db_config['host']}' user='#{db_config['user']}' dbname='#{db_config['dbname']}' password='#{db_config['password']}'" #{Rails.root.join('data', 'red-wgs84.geojson')} -nln red_line_ref`

    ActiveRecord::Migration.execute <<-SQL
        insert into parking_lines(length, maintained_at, maintained_by, geom)
          select length, updated, updatedby, wkb_geometry from red_line_ref
    SQL

    ActiveRecord::Migration.drop_table :red_line_ref
  end

end
