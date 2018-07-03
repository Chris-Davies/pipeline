pipeline {
	agent { node { label 'LinuxNode'} }
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
        sh '${BRANCH_DIR}/${PIPELINE_DIR}/build.sh'
      }
    }
    stage ('Test') { 
      steps {
        sh '${BRANCH_DIR}/${PIPELINE_DIR}/test.sh'
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
