#!/bin/bash
echo "Running build"
mkdir build_reports
echo "Hi" >> build_reports/build.html
mkdir -p ${BRANCH_DIR}/build/${BUILD_TYPE}
touch ${BRANCH_DIR}/build/${BUILD_TYPE}/gateway2
ls -al ${BRANCH_DIR}/build/${BUILD_TYPE}