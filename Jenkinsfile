pipeline {
    agent any
    
    stages{
        stage("clone code"){
            steps {
                echo "clone the code into github"
                git url:"https://github.com/Shiba07s/docker_java.git", branch:"main"
            }
            
        }
        stage ('Build'){
            steps{
                echo "successfully creating jar file"
                sh 'mvn clean package'
            }
        }
        stage("build code"){
            steps {
                echo "build image"
                sh "docker build -t sars-app-docker.jar ."
            }
            
        }
        stage("push to docker hub"){
            steps {
                 echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag sars-app-docker.jar ${env.dockerHubUser}/sars-app-docker.jar:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/sars-app-docker.jar:latest"
                }
                 
            }
            
        }
        stage("deploy"){
            steps {
                echo "deploy"
                //sh "docker-compose down && docker-compose up -d"
                docker run -p 9091:8080 sars-app-docker.jar:latest
            }
            
        }
        
    }
}
