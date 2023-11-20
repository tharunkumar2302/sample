node {
    environment {
        BUILD_ID="""${env.BUILD_ID}""" 
        COMMIT_ID="""${env.COMMIT_ID}"""
    }
    stage('Build maven') {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/sandeepkumar1234/seleniumqaops.git']]])
        sh 'mvn clean install'
    }

    stage('Build docker image') {
        sh 'docker build -t tarunkumar2302/selenium-java:$BUILD_ID .'
    }

    stage('Push image to hub') {
        withCredentials([usernamePassword(credentialsId: '9bf8f79c-fb0e-427b-a1c2-abbd929a9ef4', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
            sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
            sh 'docker push tarunkumar2302/selenium-java:$BUILD_ID'
        }
    }
}
