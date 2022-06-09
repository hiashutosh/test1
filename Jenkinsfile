pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
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
<<<<<<< Updated upstream
                            cp ${awsConfig} /root/.aws/credentials
                            mkdir -p Rewardz
=======
>>>>>>> Stashed changes
                            """
                        }
                    }
                }
            }
        stage('Setup Docker Pod') {
            steps {
                container('awscli') {
<<<<<<< Updated upstream
                  echo "This is on master branch "
                 }
=======
                    sh 'cat readme.md'
                }
>>>>>>> Stashed changes
            }
        }
    }
}
