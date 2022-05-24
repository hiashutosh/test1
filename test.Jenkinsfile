def deploy(def var, def domain, def port) {
  sh """
  echo variable: $var is defined in domain: $domain at port: $port
  """
}

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
}
    environment {
      env_var1 = "var1"
      env_var2 = "var2"
      env_var3 = "var3"
      env_domain1 = "domain1"
      env_domain2 = "domain2"
      env_domain3 = "domain3"
      env_port1 = "port1"
      env_port2 = "port2"
      env_port3 = "cron\\(\\* \\* \\* \\* \\* \\)"
    }
    
    stages {
      stage ('init') {
        steps {
          script {
            sh "mkdir -p Rewardz/"
            container('awscli') {
                
            // withCredentials([file(credentialsId: 'ashutosh-aws', variable: 'awsConfig')]) {
                sh '''
                mkdir -p Rewardz
                '''
            // }
              }
            }
          }
        }
        stage('Setup Docker Pod') {
          steps {
            container('awscli') {
              deploy(env_var1, env_domain1, env_port1)
              deploy(env_var2, env_domain2, env_port2)
              deploy(env_var3, env_domain3, env_port3)
            }
          }
        }
    }
}