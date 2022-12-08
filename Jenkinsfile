
pipeline {
    agent any
    options {
  buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '3')
}

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
                     def mavenPom = readMavenPom file: 'pom.xml'
                    def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "phani1-snapshot" : "phani-repo"
                   
                
            nexusArtifactUploader artifacts: [
                [
                    artifactId: 'raviLogin', 
                    classifier: '', 
                    file: "target/raviLogin-${mavenPom.version}.war", 
                    type: 'war'
                    ]
                    ],
                     credentialsId: 'nexus_id', 
                     groupId: 'wipro.raviLogin', 
                     nexusUrl: '172.31.8.94:8081', 
                     nexusVersion: 'nexus3', 
                     protocol: 'http', 
                     repository: nexusRepoName, 
                     version: "${mavenPom.version}"
        }
            }
            }
            stage('Build docker image'){
                steps{
                      script{
                    sh docker build . -t phani997/raviLogin-${mavenPom.version}.war:1
                        
    }
}
            }
    }
}
