pipeline {
    agent any
    stages {
        stage('clean'){
            steps {
                dir("C:/Users/User/AppData/Local/Android/Sdk/tools/bin") {
                    bat 'avdmanager delete avd -n test'
                }
            }
        }
        stage('build') {
            steps {
                bat 'npm install'
                dir("C:/Users/User/AppData/Local/Android/Sdk/tools/bin") {
                    bat 'echo no | avdmanager create avd -n test -k system-images;android-29;google_apis;x86'
                }
            }
        }
        stage('run') {
            parallel {
                stage('run avd') {
                    steps {
                        dir("C:/Users/User/AppData/Local/Android/Sdk/emulator"){
                            bat 'emulator -list-avds'
                            bat 'emulator -avd test'
                        }
                    }
                }
                stage('run app') {
                    steps {
                        sleep 300
                        bat 'adb root'
                        bat 'echo y | npm run android'
                    }
                }
                stage('stop emu') {
                    steps {
                        timeout 600
                        bat 'adb -s emulator-5554 emu kill'
                    }
                }
            }
        }
    }
}