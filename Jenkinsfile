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
        stage('package') {
            tools{
                jdk 'JDK-17'
            }
            steps {
                sh 'mvn package'
            }
        }
    }
}