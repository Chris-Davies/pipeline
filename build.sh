#!/bin/bash
echo "Running build"
mkdir -p ${BRANCH_DIR}/build/${BUILD_TYPE}
touch ${BRANCH_DIR}/build/${BUILD_TYPE}/gateway2
ls -al ${BRANCH_DIR}/build/${BUILD_TYPE}