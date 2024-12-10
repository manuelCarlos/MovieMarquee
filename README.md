# MovieMarquee Swift6 iOS Demo App

MovieMarquee is a simple iOS demo app featuring the use of the TMDB (www.themoviedb.org) backend API.
It uses SwiftUI and Swift Concurrency to display and manage information about the current most popular movies, as returned by TMDB.

## Trying It Out

- To successfully fetch data from TMDB, an API key is required 🚨.
  Paste your key into the `MovieMarquee/TMDBData/Sources/TMDBData/Resources/apiKey.json` file before you build the project.
- An internet connection is needed to allow Xcode to fetch the third party dependencies required by the project.
- Please build and Run in **Xcode  v16.1** 
  
## How to get a TMDB API Key

1. Got to https://www.themoviedb.org/signup and sign up for a free account.
2. Once signed-up, go to https://www.themoviedb.org/settings/api to regenerate or view your API key.

## Current App Feature Set

- A **Discover** tab, displaying the currently 20 most popular movies. From there we can navigate to either:
    - A movie details screen, displaying information about the movie, and the name and photo of the cast members.
    - The (paginated) full list of popular movies.

## Tests

- To execute the tests:
    - Open the project in Xcode.
    - Paste you API key into the `apiKey.json` file.
    - Select the iphone13 mini (iOS 18.1) simulator as run destination.
    - Hit `cmd+u`.
- Note that UI tests are meant to use a proper backend response, and will fail otherwise.

## Notable Implementation Features

- SwiftUI app with no third-party dependencies.
- Swift 6 ready - strict concurrency checking enabled with zero warnings :P
- Modularization using local Swift packages (SPM).
- Unit, UI and Snapshot tests setup in a test plan, covering all aspects of the implementation.
- String catalogs for localization.
