# DevOps CI Demo

A simple continuous integration project using GitHub, Jenkins, and Bash scripts.

## Project Overview

This project demonstrates a Jenkins CI Pipeline that automatically validates every change pushed to GitHub.

The Pipeline contains these stages:

1. Checkout
2. Build
3. Test
4. Validation

GitHub sends a webhook notification to Jenkins whenever code is pushed to the `main` branch.

## Project Structure

```text
devops-ci-demo/
├── Jenkinsfile
├── app.sh
├── test.sh
├── validate.sh
└── README.md
```

## Application

The application is implemented using a Bash script.

Run the application locally:

```bash
./app.sh
```

Expected output:

```text
Application is running successfully
```

## Run Tests

Execute the test script:

```bash
./test.sh
```

Expected output:

```text
Test passed
```

## Run Validation

Execute the validation script:

```bash
./validate.sh
```

Expected output:

```text
Validation passed
```

## Jenkins Pipeline

The Jenkins Pipeline is defined in the `Jenkinsfile`.

### Pipeline Stages

#### Checkout

Retrieves the source code from the GitHub repository.

#### Build

Makes the scripts executable and checks Bash syntax.

#### Test

Runs the automated test script and verifies the application output.

#### Validation

Checks that the required project files exist and that the scripts have executable permissions.

## GitHub Webhook

The GitHub repository is connected to Jenkins using a webhook.

The webhook endpoint follows this format:

```text
[https://YOUR_JENKINS_DOMAIN/github-webhook/](https://YOUR_JENKINS_DOMAIN/github-webhook/)
```

For local Jenkins testing with ngrok, the URL may look like:

```text
[https://YOUR_NGROK_DOMAIN/github-webhook/](https://YOUR_NGROK_DOMAIN/github-webhook/)
```

The webhook is configured to trigger on push events.

## Local Setup

Clone the repository:

```bash
git clone [https://github.com/nisha-subramaniyan/devops-ci-demo.git](https://github.com/nisha-subramaniyan/devops-ci-demo.git)
cd devops-ci-demo
```

Grant execute permissions:

```bash
chmod +x app.sh test.sh validate.sh
```

Run the scripts:

```bash
./app.sh
./test.sh
./validate.sh
```

## Git Commands

Check the repository status:

```bash
git status
```

Add changes:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Update CI project"
```

Push changes to GitHub:

```bash
git push origin main
```

A push to GitHub automatically triggers the Jenkins Pipeline through the configured webhook.

## Failure Testing

A controlled failure can be introduced by changing the expected output in `test.sh`.

For example, change:

```bash
Application is running successfully
```

to:

```bash
Application output is incorrect
```

The test will fail because the expected output does not match the actual application output.

Jenkins will display:

```text
Finished: FAILURE
```

The issue can be investigated using:

```bash
bash -x ./test.sh
```

## Failure Resolution

The test was fixed by restoring the correct expected output:

```bash
Application is running successfully
```

After committing and pushing the fix, Jenkins automatically ran the Pipeline again and all stages completed successfully.

Expected final result:

```text
Finished: SUCCESS
```

## Troubleshooting Summary

The first webhook attempt failed because GitHub could not connect to the local Jenkins server. Jenkins was running on `localhost`, which is not directly accessible from GitHub.

To solve this problem, an ngrok tunnel was created:

```bash
ngrok http 8080
```

The generated public URL was added to the GitHub webhook with the Jenkins endpoint:

```text
/github-webhook/
```

After configuring the webhook correctly, a GitHub push automatically triggered the Jenkins Pipeline.

## Tools Used

- Git
- GitHub
- Jenkins
- Bash
- ngrok
- Ubuntu Linux
