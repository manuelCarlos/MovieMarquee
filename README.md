# MovieMarquee

MovieMarquee is a simple demo iOS app featuring the use of the TMDB (www.themoviedb.org) backend API.
It uses SwiftUI and SwiftData to display and manage information about the current most popular movies returned by TMDB.

## Trying it out

- To successfully fetch data from TMDB, an API key is required. 
  Paste your key into the `MovieMarquee/TMDBData/Sources/TMDBData/Resources/apiKey.json` file and build and run the app.

## Current Feature Set

- A **Discover** tab, displaying the 20 most popular movies. 
  From there we can navigate to either:
    - A movie details screen.
    - The full list of popular movies.
- The movie details screen displays the name and photo of the cast. And allow marking the movie as favorite.
- A second tab, named **Favorites**, displays the list of all DB stored favorited movies, which can be deleted by the user with a left swipe.

## Tests

- The project has extensive (95% test coverage) tests for all aspects of the implementation.
- Please run snapshot tests in the (iOS18.1)iPhone 13 mini simulator, or some snapshot tests might fail 💥.
- UI tests are meant to use a successful live backend call and will fail otherwise. 
- To execute the tests, open the project in Xcode and hit `cmd+u`.

## Notable Implementation Features

- Full SwiftUI app with no third-party dependencies.
- Swift 6 ready - strict concurrency checking enabled with zero warnings :P
- Modularization using local Swift packages (SPM).
- Test plan setup to conveniently execute all app + packages tests in one go.
- String catalogs for localization.
