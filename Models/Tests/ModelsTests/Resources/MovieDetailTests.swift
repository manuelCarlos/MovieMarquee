//
//  MovieDetailTests.swift
//  Models
//
//  Created by Manuel Lopes on 12.10.24.
//


import XCTest

final class MovieDetailTests: XCTestCase {
    
    func test_movie_detail_decoding_valid_data() throws {
        let jsonData = """
        {
            "adult": false,
            "backdrop_path": "/path.jpg",
            "belongs_to_collection": null,
            "budget": 1000000,
            "genres": [{"id": 1, "name": "Action"}],
            "homepage": "http://homepage.com",
            "id": 123,
            "imdb_id": "tt1234567",
            "original_language": "en",
            "original_title": "Original Title",
            "overview": "Some overview",
            "popularity": 7.5,
            "poster_path": "/poster.jpg",
            "production_companies": [],
            "production_countries": [],
            "release_date": "2023-10-09",
            "revenue": 5000000,
            "runtime": 120,
            "spoken_languages": [],
            "status": "Released",
            "tagline": "Some tagline",
            "title": "Movie Title",
            "video": false,
            "vote_average": 8.0,
            "vote_count": 100,
            "credits": null
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let movieDetail = try decoder.decode(MovieDetail.self, from: jsonData)
        
        XCTAssertEqual(movieDetail.id, 123)
        XCTAssertEqual(movieDetail.title, "Movie Title")
        XCTAssertEqual(movieDetail.voteAverage, 8.0)
        XCTAssertEqual(movieDetail.releaseDate, DateFormatter.yyyyMMdd.date(from: "2023-10-09"))
    }

    func test_movie_detail_decoding_missing_optional_fields() throws {
        let jsonData = """
        {
            "adult": true,
            "backdrop_path": null,
            "belongs_to_collection": null,
            "budget": 2000000,
            "genres": [],
            "homepage": null,
            "id": 456,
            "imdb_id": null,
            "original_language": "en",
            "original_title": null,
            "overview": null,
            "popularity": 5.0,
            "poster_path": null,
            "production_companies": [],
            "production_countries": [],
            "release_date": "2024-10-09",
            "revenue": 8000000,
            "runtime": null,
            "spoken_languages": [],
            "status": "Planned",
            "tagline": null,
            "title": "Another Movie",
            "video": true,
            "vote_average": null,
            "vote_count": null,
            "credits": null
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let movieDetail = try decoder.decode(MovieDetail.self, from: jsonData)
        
        XCTAssertEqual(movieDetail.id, 456)
        XCTAssertEqual(movieDetail.adult, true)
        XCTAssertNil(movieDetail.posterPath)
        XCTAssertEqual(movieDetail.title, "Another Movie")
        XCTAssertEqual(movieDetail.releaseDate, DateFormatter.yyyyMMdd.date(from: "2024-10-09"))
    }
    
    func test_movie_detail_decoding_invalid_release_date_format() throws {
        let jsonData = """
        {
            "adult": false,
            "backdrop_path": "/backdrop.jpg",
            "belongs_to_collection": null,
            "budget": 3000000,
            "genres": [{"id": 2, "name": "Drama"}],
            "homepage": "http://homepage.com",
            "id": 789,
            "imdb_id": "tt7654321",
            "original_language": "fr",
            "original_title": "Original Title FR",
            "overview": "Another overview",
            "popularity": 9.0,
            "poster_path": "/poster2.jpg",
            "production_companies": [],
            "production_countries": [],
            "release_date": "09/10/2024",
            "revenue": 10000000,
            "runtime": 150,
            "spoken_languages": [],
            "status": "Released",
            "tagline": "Another tagline",
            "title": "French Movie",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 200,
            "credits": null
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let movieDetail = try decoder.decode(MovieDetail.self, from: jsonData)
        
        XCTAssertEqual(movieDetail.id, 789)
        XCTAssertNil(movieDetail.releaseDate)
    }
    
    func test_movie_detail_decoding_missing_required_field() throws {
        let jsonData = """
        {
            "adult": false,
            "backdrop_path": "/backdrop.jpg",
            "genres": [{"id": 2, "name": "Drama"}],
            "homepage": "http://homepage.com",
            "imdb_id": "tt7654321",
            "original_language": "fr",
            "original_title": "Original Title FR",
            "overview": "Another overview",
            "popularity": 9.0,
            "poster_path": "/poster2.jpg",
            "production_companies": [],
            "production_countries": [],
            "release_date": "2024-10-09",
            "revenue": 10000000,
            "runtime": 150,
            "spoken_languages": [],
            "status": "Released",
            "tagline": "Another tagline",
            "title": "French Movie",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 200,
            "credits": null
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(MovieDetail.self, from: jsonData))
    }
}
