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
                    container('awscli') {
                        withCredentials([file(credentialsId: 'ashutosh-aws', variable: 'awsConfig')]) {
                            sh """
                            mkdir -p /root/.aws/
                            touch /root/.aws/credentials
                            cp ${awsConfig} /root/.aws/credentials
                            mkdir -p Rewardz
                            """
                        }
                    }
                }
            }
        stage('Setup Docker Pod') {
            steps {
                container('awscli') {
                  echo "This is on master branch "
                 }
            }
        }
    }
}
