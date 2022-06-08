# Admin App End To End Tests

The E2E tests are UI Automation tests written in [CucumberJS]() to be executed using [Playwright]() with Typescript

# Execution

## Getting Started

- Install [Node](https://nodejs.org/en/download/).
- Have a running instance of ODS/API in Shared Instance Mode and Admin App. 
    - This can be accomplished using [ODS Docker](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker) 

## Setup

### Install 

Run `npm install` to get all dependencies

### Environment

Setup a .env file. This should be based on the .env.example file, with details such as:
    
- Admin App URL 
- Username
- Password

Additionally, there are flags  such as:
- Headless: Run in Headed or Headless mode (default is Headless)
- Trace: Save the execution trace of the tests, read more about it here: [Trace Viewer](https://playwright.dev/docs/trace-viewer)
- Video: Record a video of the execution.

> **Note**
> The video recordings are ignored from the source code, but those are never automatically deleted from your folder, therefore, be in the lookup for any large amount of videos saved.
> Additionally, the video feature of playwright does not have an option to set file name, so, all videos will be saved in the folder and you'll need to find them by creation date.
> When possible, prefer traces over videos since the traces are organized by test and have more information than the video.




## Run

Before running, you need to specify the URL, username and password in an .env file. File .env.example is a guide about how to set the variables.

To execute the tests, run `npm test`

## Debug

The preferred method for debug is the integrated playwright inspector.

```
$env:PWDEBUG=1
npm run test
```
