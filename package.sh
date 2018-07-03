#!/bin/bash
echo "Running package"
mkdir -p ${BRANCH_DIR}/build/${BUILD_TYPE}
touch ${BRANCH_DIR}/build/${BUILD_TYPE}/gateway2.tar.gz

ls -aRl ${BRANCH_DIR}/build
ls -aRl ${BRANCH_DIR}/build/${BUILD_TYPE}/gateway2.tar.gz
