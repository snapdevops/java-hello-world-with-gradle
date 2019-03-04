pipeline {
  agent any
  stages {
    //  First stage 
    stage ('build') {
      steps {
        script {
        // checkout scm    
        git 'https://github.com/snapdevops/java-hello-world-with-gradle.git'
        sh './gradlew clean build '
          //
          // i used a script block because you can jam arbitrary groovy in here
          // without being constrained ccby the declarative Jenkinsfile DSL
          //def awesomeVar = 'so_true'
          //print "look at this: ${awesomeVar}"
          //
          // accessing a predefined variable:
          //echo "currentBuild.number: ${currentBuild.number}"
        }
      }
    }
    // For Testing
      stage ('Test') {
      steps {
        script {
        // checkout scm    
        //git 'https://github.com/snapdevops/java-hello-world-with-gradle.git'
        sh './gradlew test '

          // i used a script block because you can jam arbitrary groovy in here
          // without being constrained ccby the declarative Jenkinsfile DSL
         // def awesomeVar = 'so_true'
          //print "look at this: ${awesomeVar}"

          // accessing a predefined variable:
          //echo "currentBuild.number: ${currentBuild.number}"
        }
       } 
    }
    
    // For Building archieve
      stage ('Archieve artifacts to artifactory') {
      steps {
        script {
       archiveArtifacts artifacts: 'build/libs/**/*.jar', fingerprint: true
              }
            }
           }
    
    // Building Docker images
    
     // For Building Docker images
      stage ('Building Docker Image') {
      steps {
        script {
          sh 'docker info '
          sh 'docker build -t mycustomnginxbuild .'
         // #      
        }
      }
    }
   // main loop ends below
    // main loop ends below
  }
}
