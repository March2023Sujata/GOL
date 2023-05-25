pipeline {
    agent { label 'Node' }
    triggers {
       pollSCM('* * * * *')
    }
    stages {
        stage('vcs') {
            steps {
                git url: 'https://github.com/March2023Sujata/GOL.git',
                    branch: 'master'
            }
        }
        stage('build and push') {
            steps {
                sh 'docker image build -t sujatajoshi/gameoflife:latest .'
                sh 'docker image push sujatajoshi/gameoflife:latest'
            }
        }
        stage('deploy') {
            steps {
                sh 'kubectl apply -f .'
                sh 'sleep 10s'
                sh 'kubectl get svc'
            }
        }
    }
}