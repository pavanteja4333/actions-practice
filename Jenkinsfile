pipeline{
    agent 
    {
        label 'Test'
    }

    stages{
        stage('Build')
        {
            agent any
            steps
            {
               sh "echo 'Building...'"
               
            }
        }
        stage('Test')
        {
            agent 
            {
                node 
                {
                    label 'Test'
                    customWorkspace '/home/jenkins/workspace/Test'
                }
            }
            
            steps
            {
               sh "echo 'Testing...'"
               
            }
        }
    }
}