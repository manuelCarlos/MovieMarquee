# MovieMarquee

MovieMarquee is a simple demo iOS app featuring the use of the TMDB (www.themoviedb.org) backend API.
It uses SwiftUI, SwiftData and the Swift Package Manager(SPM) to display and manage information about the current most popular movies.

## Current Feature Set

- A "Discover" tab, displaying the 20 most popular movies. From there we can navigate to either:
    - A movie details screen.
    - The full list of popular movies.
- The movie details screen displays the name and photo of the cast. And allow marking the movie as favorite.
- A second tab, named "Favorites", displays the list of all favorited movies that are store in the app's DB. 

## Testing

- There's currently extensive test coverage of all the implementation - 95% coverage at the moment.
- Please run snapshot tests in the (iOS18.1)iPhone 13 mini simulator, or some snapshot tests might fail 💥.
- To execute the tests, hit **cmd+u** after opening the project in Xcode.

## Notable Implementation Features

- Full SwiftUI app with no third-party dependencies.
- Swift 6 ready - strict concurrency checking enabled with zero warnings :P
- Modularization using local Swift packages (SPM).
- Test plan setup to conveniently execute all app + packages tests in one go.
- String catalogs for localization.
- Code formatting enabled via Swiftlint.
