# MovieMarquee App

MovieMarquee is a simple iOS demo app featuring the use of the TMDB (www.themoviedb.org) backend API.
It uses SwiftUI and SwiftData to display and manage information about the current most popular movies, as returned by TMDB.

## Trying It Out

- To successfully fetch data from TMDB, an API key is required.
  Paste your key into the `MovieMarquee/TMDBData/Sources/TMDBData/Resources/apiKey.json` file, then build and run the app.

## Current Feature Set

- A **Discover** tab, displaying the currently 20 most popular movies. From there we can navigate to either:
    - A movie details screen.
    - The full list of popular movies.
- The movie details screen allows marking the movie as favorite, and displays the name and photo of the cast members.
- A second, **Favorites** tab, displays a list of all movies favorited by the user. These items can be deleted from the list with a left swipe, which also unfavorites the movie.

## Tests

- The project has extensive (95% test coverage) tests for all aspects of the implementation.
- Please run snapshot tests in the (iOS18.1)iPhone 13 mini simulator, or some snapshot tests might fail 💥.
- UI tests are meant to use a successful live backend call and will fail otherwise. 
- To execute the tests, open the project in Xcode and hit `cmd+u`.

## Notable Implementation Features

- SwiftUI app with no third-party dependencies.
- Swift 6 ready - strict concurrency checking enabled with zero warnings :P
- Modularization using local Swift packages (SPM).
- Unit, UI and Snapshot tests setup in a test plan.
- String catalogs for localization.
