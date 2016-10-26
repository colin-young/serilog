#!/bin/bash
dotnet restore
for path in src/*/project.json; do
    dirname="$(dirname "${path}")"
    dotnet build ${dirname} -c Release
done 
for path in test/Serilog.PerformanceTests/project.json; do
    dirname="$(dirname "${path}")" 
    dotnet test ${dirname} -f netcoreapp1.0  -c Release
done