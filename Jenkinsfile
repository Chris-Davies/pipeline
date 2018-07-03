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
        sh 'Repo/${PIPELINE_DIR}/build.sh'
      }
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
    stage ('Test') { 
      steps {
        sh 'Repo/${PIPELINE_DIR}/test.sh'
      }
    }
    post {
      always {
        junit healthScaleFactor: 0.0, testDataPublishers: [[$class: 'ClaimTestDataPublisher']], testResults: 'Repo/build/' + env.BUILD_TYPE +'/test-*.xml'
      }
    }
    stage ('Package') {
      steps {
       sh 'Repo/${PIPELINE_DIR}/package.sh'
        archiveArtifacts artifacts: 'Repo/build/${BUILD_TYPE}/*.tar.gz', fingerprint: true
      }
    }
  }
}
