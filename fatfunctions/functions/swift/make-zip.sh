# create fat-swift.zip file
docker run -i openwhisk/action-swift-v4.2 -compile main <main.swift >fat-swift.zip

# add data files
zip -u fat-swift.zip ../randomdata/numbers-1.dat ../randomdata/numbers-2.dat
