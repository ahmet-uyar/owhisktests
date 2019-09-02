# go to out directory
cd Apache.OpenWhisk.Example.Dotnet/out/
cp ~/owhisktests/fatfunctions/functions/randomdata/numbers-1.dat .
cp ~/owhisktests/fatfunctions/functions/randomdata/numbers-2.dat .

zip -r -0 fat-dotnet.zip *
mv fat-dotnet.zip ../..

rm numbers-*.dat
