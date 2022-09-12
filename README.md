# Hecker Jobz 💼

Hecker Jobz is an application that lists jobs from all around the world !

Thanks to HackerNews API


## Goal for V1.0

Create a multi screen application which displays jobs listed on HackerNews in a List and shows details of it another screen using WebView.

### Challenges
The challenging parts for phase 1 were:
1. Read data from API which was not in JSON format but in Array(int) format.
2. Some of the views did not have an `URL` field but had `text`field containing HTML string, had to search for a way to render HTML string in WebView if only `text` field was available.


### Targets for next version:
1. Show the user a loading indicator when the list of jobs is loading and also in the webview.
2. Avoid title text's auto truncation.
3. Add authentication and data storage so that user can log in and mark a job - say applied.
