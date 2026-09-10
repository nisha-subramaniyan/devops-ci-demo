pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application'
                sh '''
                    chmod +x app.sh test.sh validate.sh
                    bash -n app.sh
                    bash -n test.sh
                    bash -n validate.sh
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests'
                sh './test.sh'
            }
        }

        stage('Validation') {
            steps {
                echo 'Running project validation'
                sh './validate.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully'
        }

        failure {
            echo 'Pipeline failed. Check the Console Output.'
        }

        always {
            echo "Completed build: ${env.BUILD_NUMBER}"
        }
    }
}
