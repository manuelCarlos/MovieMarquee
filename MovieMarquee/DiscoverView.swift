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