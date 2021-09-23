#!/bin/bash

instanceFile=${WORKSPACE}/src/main/resources/application.properties
if [ -f "$instanceFile" ]; then
   grid_url=$(cat "$instanceFile" | grep grid.url)
   application_url=$(cat "$instanceFile" | grep application.url)
   es_url=$(cat "$instanceFile" | grep es.url)
   test_planId=$(cat "$instanceFile" | grep test.planId)

   
   updated_grid_url="grid.url=$gridurl"
   updated_application_url="application.url=$applicationurl"
   updated_es_url="es.url=$esurl"
   updated_test_planId="test.planId=$testplanId"
    
   # SED command to replace exisitng line with newly updated line in InstanceFile
   sed -i "s|$grid_url|$updated_grid_url|g" "$instanceFile"
   sed -i "s|$application_url|$updated_application_url|g" "$instanceFile"
   sed -i "s|$es_url|$updated_es_url|g" "$instanceFile"
   sed -i "s/$test_planId/$updated_test_planId/g" "$instanceFile"
fi
