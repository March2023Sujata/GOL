pipeline {
    agent { label 'Node' }
    stages {
        stage('vcs') {
            steps {
                git url: 'https://github.com/March2023Sujata/GOL.git',
                    branch: 'master'
            }
        }
        stage('package') {
            steps {
                sh 'mvn package'
            }
        }
    }
}