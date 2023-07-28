## Command Line for the win

# Project Title

This is the command line for the win project.

## Description

This project is a simple application that demonstrates the use of the SFTP command-line tool to move screenshots from a local machine to a sandbox environment.

## Requirements

* A terminal or command prompt
* The SFTP command-line tool
* The hostname, username, and password for the sandbox environment

## Instructions

1. Take the screenshots of the completed levels as mentioned in the general requirements.
2. Open a terminal or command prompt on your local machine.
3. Use the following command to establish a connection to the sandbox environment:

`sftp <hostname> -i <path_to_private_key>`

4. Once connected, navigate to the directory where you want to upload the screenshots.
5. Use the following command to upload the screenshots from your local machine to the sandbox environment:

`put <path_to_screenshot>`

6. Confirm that the screenshots have been successfully transferred by checking the sandbox directory.
7. Once the screenshots are transferred, you can proceed to push the screenshots to GitHub as mentioned in the initial requirements.

## Author

This project was created by Hassan Cissey.
