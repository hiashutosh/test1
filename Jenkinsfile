pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:dind
    securityContext:
      privileged: true
    env:
      - name: DOCKER_TLS_CERTDIR
        value: ""
  - name: awscli
    image: amazon/aws-cli:2.3.4
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo hello; sleep 10;done"]
'''
      }
    }
options {
  ansiColor('xterm')
  skipDefaultCheckout true
  checkoutToSubdirectory '/Rewardz/'
}
    stages {
            stage ('init') {
                steps {
                    sh "mkdir -p Rewardz/"

                    checkout([$class: 'GitSCM', branches: [[name: "$ghprbSourceBranch"]], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'Rewardz']], userRemoteConfigs: [[url: 'https://github.com/hiashutosh/test2.git'], [url: 'https://github.com/hiashutosh/test1.git']]])
                    container('awscli') {
                        withCredentials([file(credentialsId: 'ashutosh-aws', variable: 'awsConfig')]) {
                            sh """
                            mkdir -p /root/.aws/
                            touch /root/.aws/credentials
                            """
                        }
                    }
                }
            }
        
        
        stage('Setup Docker Pod') {
            steps {
                container('awscli') {
                    sh 'cat readme.md'
                }
            }
        }
    }
}
