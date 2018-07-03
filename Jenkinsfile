def test_build_results() {
  def out = sh script: "cat ${BRANCH_DIR}/build/${BUILD_TYPE}/build-result.txt", returnStdout: true
  def (res, err , warn) = out.trim().tokenize(':')
  if (res.toInteger()>0) {
    echo "Make returned error: Setting build to FAILURE"
    currentBuild.result = 'FAILURE'
  } else if (err.toInteger()>0) {
    echo "Output parser founded errors: Setting build to FAILURE" 
    currentBuild.result = 'FAILURE'
  } else if (warn.toInteger()>0) {
    echo "Output parser founded warnings: Setting build to UNSTABLE"
    currentBuild.result = 'UNSTABLE'
  }
}

pipeline {
	agent { node { label "${NODE_TYPE}" } }
  environment {
    PIPELINE_DIR="."
    BRANCH_DIR="Repo"
  }
	options {
    	ansiColor('xterm')
    	skipDefaultCheckout()
    	timestamps()
    	buildDiscarder(logRotator(numToKeepStr: '3'))
  }

	stages {
		stage('Checkout') {
      steps { checkout scm }
    }
  	stage("Build") {
      steps {
        dir('build_reports') { deleteDir(); }
        sh 'printenv'
        sh "${BRANCH_DIR}/${PIPELINE_DIR}/build.sh"
        test_build_results()
      }
      post {
        always {
          publishHTML (target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: 'build_reports',
              reportFiles: 'build.html',
              reportName: "Build Report"
            ])
        }
      }
    }
    stage ('Test') { 
      steps {
        sh '${BRANCH_DIR}/${PIPELINE_DIR}/test.sh'
      }
      post {
        always {
          junit healthScaleFactor: 0.0, testDataPublishers: [[$class: 'ClaimTestDataPublisher']], testResults: "${BRANCH_DIR}/build/${BUILD_TYPE}/test-*.xml"
        }
      }
    }
    stage ('Package') {
      steps {
       sh 'Repo/${PIPELINE_DIR}/package.sh'
        archiveArtifacts artifacts: "${BRANCH_DIR}/build/${BUILD_TYPE}/*.tar.gz", fingerprint: true
      }
    }
  }
}
