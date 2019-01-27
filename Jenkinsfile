pipeline {
    agent { label 'Docker' }
        stages {
            stage('Show infos') {
                steps {
                    bash '''#!/bin/bash
                    ls
                    docker info
                    '''
                }
            }
            
            stage('Build image') {
                steps {
                    bash '''#!/bin/bash
                    docker build -t msahib/jenkins-build-master:0.0.${BUILD_NUMBER}_$(date +'%Y-%m-%d') .
                    '''
                }
            }
            
            stage('Push image') {
                steps {
                    bash '''#!/bin/bash
                    docker push msahib/jenkins-build-master:0.0.${BUILD_NUMBER}_$(date +'%Y-%m-%d')
                    '''
                }
            }
            
            stage('Show local images before removing') {
                steps {
                    bash '''#!/bin/bash
                    docker images
                    '''
                }
            }
            
            stage('Remove local image') {
                steps {
                    bash '''#!/bin/bash
                    docker rmi msahib/jenkins-build-master:0.0.${BUILD_NUMBER}_$(date +'%Y-%m-%d')
                    '''
                }
            }
            
            stage('Show local images after removing') {
                steps {
                    bash '''#!/bin/bash
                    docker images
                    '''
                }
            }
            
            stage('Setting the variables values') {
                steps {
                    bash '''#!/bin/bash
                    echo "hello world" 
                    '''
                }
            }
    }
}
