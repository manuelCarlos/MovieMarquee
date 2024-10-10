//
//  DashboardView.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 09.10.24.
//

import SwiftUI
import NetworkService
import Models

enum Icons: String, RawRepresentable {
    case favoriteOn = "heart.fill"
    case favoriteOff = "heart"

    case posterBackdrop = "film"

    case artistImageBackdrop = "person.fill"

    public enum TabBar: String {
        case discover = "square.grid.2x2.fill"
        case artist = "person.crop.circle"
        case favorites = "star.circle.fill"
    }

    case seeAllButton = "chevron.right"
}




enum MediaSection: CaseIterable {
    case popularMovies
    case mostRecentMovies
    case comingSoonMovies

    var type: MediaType {
        switch self {
        case .popularMovies:
            return .movie
        case .mostRecentMovies:
            return .movie
        case .comingSoonMovies:
            return .movie
        }
    }
}


struct DiscoverView: View {
    @State var presenter: DiscoverDefaultPresenter

    init(presenter: DiscoverDefaultPresenter) {
        self.presenter = presenter
    }

    var body: some View {
        NavigationView {
            contentView
        }
        .navigationBarTitle(ConstantTexts.NavigationBarTitle.discoverScreen)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .padding(
            EdgeInsets(
                top: 5,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
        )
    }

    @ViewBuilder
    private var contentView: some View {
        switch presenter.state {
        case .idle:
            IdleStateView {
                presenter.fetchMedia()
            }
        case .loading:
            LoadingStateView()
        case .failed(let error):
            FailedStateView(error: error) {
                presenter.fetchMedia()
            }
        case .loaded(let popularMovies):
            LoadedStateView(popularMovies: popularMovies)
        }
    }
}

struct IdleStateView: View {
    let onAppear: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Loading...")
        }
        .task {
            onAppear()
        }
    }
}

struct LoadingStateView: View {
    var body: some View {
        ProgressView()
    }
}

struct FailedStateView: View {
    let error: Error
    let onRetry: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Oops, something went wrong")
        } description: {
            Text("Error: \(error.localizedDescription)")
        } actions: {
            Button {
                Task {
                    onRetry()
                }
            } label: {
                Text("Retry")
                    .font(.title)
            }
        }
    }
}

struct LoadedStateView: View {
    let popularMovies: [Watchable]

    var body: some View {
        DiscoverSlice(
            sliceTitle: ConstantTexts.SectionHeader.mostPopular,
            sliceItems: popularMovies,
            section: MediaSection.popularMovies
        )
    }
}


//struct DiscoverView: View {
//    @State var presenter: DiscoverDefaultPresenter
//
//    init(presenter: DiscoverDefaultPresenter) {
//        self.presenter = presenter
//
//    }
//
//    var body: some View {
//        NavigationView {
//
//            switch presenter.state {
//            case .idle:
//                ContentUnavailableView {
//                    Text("Loding...")
//                }
//                .task {
//                    presenter.fetchMedia()
//                }
//            case .loading:
//                ProgressView()
//            case .failed(let error):
//                ContentUnavailableView {
//                    Text("Oops, something went wrong")
//                } description : {
//                    Text("Error: \(error.localizedDescription)")
//                } actions: {
//                    Button {
//                        Task {
//                            presenter.fetchMedia()
//                        }
//                    } label: {
//                        Text("Retry")
//                            .font(.title)
//                    }
//                }
//            case .loaded(let popularMovies):
//                    DiscoverSlice(
//                        sliceTitle: ConstantTexts.SectionHeader.mostPopular,
//                        sliceItems: popularMovies,
//                        section: MediaSection.popularMovies
//                    )
//            }
//        }
//        .navigationBarTitle(ConstantTexts.NavigationBarTitle.discoverScreen)
//        .navigationBarHidden(false)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        .padding(
//            EdgeInsets(
//                top: 5,
//                leading: 0,
//                bottom: 0,
//                trailing: 0
//            )
//        )
//    }
//}

protocol DiscoverPresenter {
    var interactor: MediaInteractor { get }
    func fetchMedia() async
}


protocol MediaInteractor {
    func fetchNextPopularPageAsFullList() async throws -> [Watchable]
}



protocol Fetchable {
    func fetchSinglePage() async throws -> [Watchable]
    func fetchWithNextPage() async throws -> [Watchable]
}


final class DefaultMediaInteractor: MediaInteractor {

    let popularMoviesFetcher: Fetchable = MediaFetcher(
        mediaListFetcher: PopularMoviesFetcher(),
        service: MovieService.shared
    )

    func fetchNextPopularPageAsFullList() async throws -> [Watchable] {
        return try await popularMoviesFetcher.fetchWithNextPage()
    }

}

protocol Watchable: Codable {
    var id: Int { get }
    var title: String { get }
    var voteAverage: Double? { get }
    var posterPath: String? { get }
    var backdropPath: String? { get }
    var overview: String? { get }
    var originalTitle: String? { get }
    var originalLanguage: OriginalLanguage? { get }
    var voteCount: Int? { get }
    var popularity: Double { get }
    var posterUrl: String { get }
}

extension Watchable {

    var posterUrl: String {
        APIConstants.defaultScheme +
        APIConstants.baseImgUrl +
        APIConstants.baseImgUrlPath +
        imagePath
    }

    var imagePath: String { return posterPath ?? backdropPath ?? "" }
}

protocol WatchableDetail: Watchable {
    var genres: [Genre] { get }
    var productionCompanies: [ProductionCompany]? { get }
    var productionCountries: [ProductionCountry]? { get }
    var tagline: String? { get }
    var credits: Credits? { get }
    var spokenLanguages: [SpokenLanguage]? { get }
    var homepage: String? { get }
}

protocol MediaService {
    func fetchMedia(request: NetworkRequest) async throws -> [Watchable]
}

class MediaFetcher: Fetchable {

    private var mediaList: [Watchable] = []
    private var pageCounter: Int = 0

    private var mediaListfetcher: MediaListFetcher
    private var mediaService: MediaService

    init(mediaListFetcher: MediaListFetcher, service: MediaService) {
        self.mediaListfetcher = mediaListFetcher
        self.mediaService = service
    }

    func fetchSinglePage() async throws -> [Watchable] {
        pageCounter += 1
        var watchables: [Watchable] = []
        watchables = try await mediaService.fetchMedia(request: mediaListfetcher.fetch(page: pageCounter))
        return watchables
    }

    func fetchWithNextPage() async throws -> [Watchable] {
        let page = try await fetchSinglePage()
        self.mediaList.append(contentsOf: page)
        return self.mediaList
    }
}

struct DiscoverSlice: View {

    var sliceTitle: String
    var sliceItems: [Watchable]
    var section: MediaSection

    internal init(sliceTitle: String, sliceItems: [Watchable], section: MediaSection) {
        self.sliceTitle = sliceTitle
        self.sliceItems = sliceItems
        self.section = section
    }

    var seeAllView: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Text(ConstantTexts.ButtonTitle.sliceSeeAll)
                .foregroundColor(.accentColor)
                .font(.title2)
                .bold()
            Image(systemName: Icons.seeAllButton.rawValue)
                .foregroundColor(.accentColor)
                .padding(.bottom, 4)
        }
        .padding(.trailing, 10)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center) {
                Text(self.sliceTitle)
                    .font(.title)
                    .bold()
                Spacer()
                //                NavigationLink(
                //                    destination: MediaListView(
                //                        mediaListPresenter: MediaListDefaultPresenter(
                //                            DefaultMediaInteractor(),
                //                            section: self.section
                //                        )
                //                    )
                //                ) {
                //                    seeAllView
                //                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 5)

            if sliceItems.isEmpty {
                ProgressView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(self.sliceItems, id: \.id) { item in
                            DiscoverSliceItem(item: item)
                                .frame(width: 140, height: 240, alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

extension Movie: Watchable {}

final class MovieService: MediaService {
    private let requestManager: RequestManagerProtocol

    public static let shared = MovieService()

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func fetchMedia(request: NetworkRequest) async throws -> [Watchable] {
        let movies: Movies = try await requestManager.decode(networkRequest: request)
        return movies.results
    }
}

@MainActor
struct DiscoverSliceItem: View {

    var item: Watchable

    init(item: Watchable) {
        self.item = item
    }

    fileprivate func posterImage() -> some View {
        AsyncImage(url: URL(string: item.posterUrl)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .border(.secondary, width: 1)
            case .failure, .empty:
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.1)
            @unknown default:
                ProgressView()
            }
        }
    }

    var body: some View {
        posterImage()
    }
}
