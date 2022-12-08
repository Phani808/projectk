pipeline {
    agent any
    
    stages {
        stage('Repo cloning') {
            steps {
              git 'https://github.com/Phani808/projectk.git'
            }
        }
        stage('maven build') {
        steps{    
            sh 'mvn install'
            }
        }
        stage('code analysis') {
            steps {
                withSonarQubeEnv('mysonar') { 
                    sh "mvn sonar:sonar"
                }
            }
             
        } 
        stage('upload artifact') {
            steps{
                script{
                def mavenPom = readMavenPom 'pom.xml'
                
            nexusArtifactUploader artifacts: [[artifactId: 'raviLogin', classifier: '', file: "target/raviLogin-${mavenPom.version}.war", type: 'war']], credentialsId: 'nexus_id', groupId: 'wipro.raviLogin', nexusUrl: '172.31.8.94:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'phani-repo', version: "${mavenPom.version}"
        }
            }
            }
    }
}
