node {  
    stage('Clone sources') {
        git url: 'http://10.26.34.160/root/oms-project.git'
    }
    stage ('Build OMS') {
        sh 'mvn clean install'
    }
    stage ('Upload WAR-file to nexus') {
        sh 'mvn clean deploy'  
    }
}


