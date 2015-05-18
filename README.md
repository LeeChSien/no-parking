No-parking
==============

這是一個 Rails + POSTGIS 的範例

前端地圖圖層是使用 AngularJS + Leaflet + Tilemap Image

後端將地理資訊匯入及查詢地點

則是使用 POSTGIS 及 `activerecord-postgis-adapter` 完成

Demo
==============

http://noparking-chsien.rhcloud.com/

Getting Start
==============

匯入圖資請使用 `rake parse:import_geojson`

因為 Github 有檔案大小限制

台北市禁止停車紅線 Geojson 放在這：https://goo.gl/Vq0kvb
