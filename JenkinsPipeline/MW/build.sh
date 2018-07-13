#!/bin/bash
echo "Running build"
mkdir build_reports
echo "Hi" >> build_reports/build.html
echo "JAVA_HOME = $JAVA_HOME"
printenv | sort
mkdir -p build/${BUILD_TYPE}
touch build/${BUILD_TYPE}/gateway2
ls -al build/${BUILD_TYPE}
echo "0:0:0" >> build/${BUILD_TYPE}/build-result.txt
