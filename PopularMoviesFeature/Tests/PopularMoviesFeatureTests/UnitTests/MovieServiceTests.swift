//
//  MovieServiceTests.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

import XCTest

@testable import Models
@testable import PopularMoviesFeature
@testable import NetworkService

@available(iOS 17.0, *)
final class MovieServiceTests: XCTestCase {

    // MARK: - Test Fetching Media

    func test_fetch_media_successfully() async throws {
        let mockRequestManager = MockRequestManager()
        mockRequestManager.mockMedia = Movies.make()
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        let watchables = try await service.fetchMedia(request: mockRequest)
        let movie = watchables.first as? Movie

        XCTAssertEqual(watchables.count, 1)
        XCTAssertEqual(movie?.title, "Airplane")
        XCTAssertEqual(movie?.posterUrl, "https://image.tmdb.org/t/p/w500posterPath")
        XCTAssertEqual(movie?.overview, "Good movie")
        XCTAssertEqual(movie?.id, 10)
        XCTAssertEqual(movie?.releaseDate, .distantPast)
        XCTAssertEqual(movie?.genreIds, [1, 2])
        XCTAssertEqual(movie?.originalTitle, "Original Title")
        XCTAssertEqual(movie?.originalLanguage, .en)
        XCTAssertEqual(movie?.popularity, 10)
        XCTAssertEqual(movie?.voteCount, 8)
        XCTAssertEqual(movie?.video, false)
        XCTAssertEqual(movie?.voteAverage, 10)
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_failure() async throws {
        let mockRequestManager = MockRequestManager(shouldFail: true)
        mockRequestManager.mockMedia = Movies.make()
        let service = MovieService(requestManager: mockRequestManager)
        let mockRequest = MockNetworkRequest.make()

        do {
            _ = try await service.fetchMedia(request: mockRequest)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(error as? NetworkError, .invalidHTTPURLResponse)
        }
    }

    // MARK: - Tests Fetching Media Details

    func test_fetch_media_details_successfully() async throws {
        let mockRequestManager = MockRequestManager()
        mockRequestManager.mockMediaDetail = MovieDetails.make()
        let service = MovieService(requestManager: mockRequestManager)
        let movieID = 123 // Mock movie ID

        let movieDetail = try await service.fetchMediaDetails(mediaId: movieID)

        XCTAssertEqual(movieDetail.id, 12)
        XCTAssertEqual(movieDetail.title, "The cookie monster")
        XCTAssertEqual(movieDetail.overview, "A cookie monster is a fictional creature that appears in various media, including animated films, video games, and comic books.")
        XCTAssertEqual(movieDetail.popularity, 4.4)
        XCTAssertEqual(movieDetail.genres, [Genre(id: 1, name: "Action"), Genre(id: 2, name: "Comedy")])
        XCTAssertEqual(movieDetail.voteAverage, 9)
        XCTAssertEqual((movieDetail as? MovieDetails)?.releaseDate, Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 24))!)
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_details_failure() async throws {
        let mockRequestManager = MockRequestManager(shouldFail: true)
        mockRequestManager.mockMediaDetail = MovieDetails.make()
        let service = MovieService(requestManager: mockRequestManager)
        let movieID = 123 // Mock movie ID

        do {
            _ = try await service.fetchMediaDetails(mediaId: movieID)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(error as? NetworkError, .invalidHTTPURLResponse)
        }
    }

    // MARK: - Tests Fetching Media Cast

    func test_fetch_media_cast_successfully() async throws {
        let movieID = 123
        let mockRequestManager = MockRequestManager()
        mockRequestManager.mockMediaCast = Credits(cast: [Cast.make()], crew: [], id: movieID)
        let service = MovieService(requestManager: mockRequestManager)

        let mediaCredits = try await service.fetchMediaCredits(mediaId: movieID)

        XCTAssertEqual(mediaCredits.id, 123)
        XCTAssertEqual(mediaCredits.cast.count, 1)
        XCTAssertEqual(mediaCredits.crew.count, 0)
        XCTAssertEqual(mediaCredits.cast.first?.id, 12345)
        XCTAssertEqual(mediaCredits.cast.first?.name, "John Doe")
        XCTAssertEqual(mediaCredits.cast.first?.character, "Main Character")
        XCTAssertEqual(mediaCredits.cast.first?.profilePath, "/profilePath.jpg")
        XCTAssertEqual(mediaCredits.cast.first?.order, 1)
        XCTAssertEqual(mediaCredits.cast.first?.knownForDepartment, .acting)
        XCTAssertEqual(mediaCredits.cast.first?.gender, 1)
        XCTAssertEqual(mediaCredits.cast.first?.job, "Actor")
        XCTAssertEqual(mockRequestManager.decodeCallCount, 1)
    }

    func test_fetch_media_cast_failure() async throws {
        let movieID = 123
        let mockRequestManager = MockRequestManager(shouldFail: true)
        mockRequestManager.mockMediaCast = Credits(cast: [Cast.make()], crew: [], id: movieID)
        let service = MovieService(requestManager: mockRequestManager)

        do {
            _ = try await service.fetchMediaCredits(mediaId: movieID)
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(error as? NetworkError, .invalidHTTPURLResponse)
        }
    }

}
