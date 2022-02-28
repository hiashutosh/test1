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


options {
  ansiColor('xterm')
  skipDefaultCheckout true
}
    stages {
            stage ('init') {
                steps {
                    sh "mkdir -p Rewardz/"
                    checkout([$class: 'GitSCM', branches: [[name: '*/testbranch2']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'Rewardz/']], userRemoteConfigs: [[url: 'https://github.com/hiashutosh/test1.git']]])

                    // checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'Rewardz']], userRemoteConfigs: [[url: 'https://github.com/hiashutosh/test2.git'], [url: 'https://github.com/hiashutosh/test1.git']]])
                    container('awscli') {
                        withCredentials([file(credentialsId: 'ashutosh-aws', variable: 'awsConfig')]) {
                            sh """
                            mkdir -p /root/.aws/
                            touch /root/.aws/credentials
                            cp ${awsConfig} /root/.aws/credentials
                            yum update -y   && yum install -y jq  && yum clean all
                            mkdir -p Rewardz
                            """
                        }
                    }
                }
            }
        
        
        stage('Setup Docker Pod') {
            steps {
                container('awscli') {
                    
                    sh '''/usr/local/bin/aws ec2 describe-instance-status --instance-id i-02553566ece339587 --profile rewardz --region ap-southeast-1 | jq -r '.InstanceStatuses[] | .SystemStatus.Details[] | .Status' | sort -u                '''
                }
            }
        }
    }
}
