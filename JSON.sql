##########################
# 16.11.2017 by baruch@brillix.co.il
#       JSON on MySQL 5.7.X
############

SET @document = '[10,20,[30,40]]';

select json_extract(json_extract(@document,'$[2]'),'$[1]');











CREATE TABLE features (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    feature JSON NOT NULL
);


INSERT  into  features (feature) VALUES ('{
   "type":"Feature",
   "geometry":{
      "type":"Polygon",
      "coordinates":[
         [
            [-122.42200352825247,37.80848009696725,0],
            [-122.42207601332528,37.808835019815085,0],
            [-122.42110217434865,37.808803534992904,0],
            [-122.42106256906727,37.80860105681814,0],
            [-122.42200352825247,37.80848009696725,0]
         ]
      ]
   },
   "properties":{
      "TO_ST":"0",
      "BLKLOT":"0001001",
      "STREET":"UNKNOWN",
      "FROM_ST":"0",
      "LOT_NUM":"001",
      "ST_TYPE":null,
      "ODD_EVEN":"E",
      "BLOCK_NUM":"0001",
      "MAPBLKLOT":"0001001"
   }
}');

INSERT  into  features (feature) VALUES ('{
   "type":"Feature",
   "geometry":{
      "type":"Polygon",
      "coordinates":[
         [
            [-122.42200352825247,37.80848009696725,0],
            [-122.42207601332528,37.808835019815085,0],
            [-122.42110217434865,37.808803534992904,0],
            [-122.42106256906727,37.80860105681814,0],
            [-122.42200352825247,37.80848009696725,0]
         ]
      ]
   },
   "properties":{
      "TO_ST":"0",
      "BLKLOT":"0001001",
      "STREET":"MARKET",
      "FROM_ST":"0",
      "LOT_NUM":"1001",
      "ST_TYPE":null,
      "ODD_EVEN":"E",
      "BLOCK_NUM":"0001",
      "MAPBLKLOT":"0001001"
   }
}');


SELECT json_extract(feature,'$.geometry.coordinates') FROM features
WHERE feature->"$.properties.STREET" = 'MARKET';




