struct FavoriteMoviesScene: View {

    @State private var sortOrder = SortDescriptor(\FavoriteMovie.name)
    let modelContext: ModelContext


    var body: some View {
        NavigationStack {
            FavoriteMoviesList(sort: sortOrder, modelContext: modelContext)
            .navigationTitle("Favorite Movies")
            .toolbar {
                Button("Add Samples", action: addSamples)
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\FavoriteMovie.name))

                        Text("Release date")
                            .tag(SortDescriptor(\FavoriteMovie.releaseDate))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }

    func addSamples() {
        let rome = FavoriteMovie(id: 1, name: "Rome")
        let florence = FavoriteMovie(id: 2, name: "Florence")
        let naples = FavoriteMovie(id: 3, name: "Naples")

        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)

        try? modelContext.save()
    }

}

struct FavoriteMoviesList: View {

    @Query(sort: [SortDescriptor(\FavoriteMovie.releaseDate, order: .reverse),
                  SortDescriptor(\FavoriteMovie.name)])
    private var favorites: [FavoriteMovie]

    private let modelContext: ModelContext

    init(sort: SortDescriptor<FavoriteMovie>, modelContext: ModelContext) {
        _favorites = Query(sort: [sort])
        self.modelContext = modelContext
    }

    var body: some View {
        if favorites.isEmpty {
            ContentUnavailableView {
                Text("No Favorite movies for now")
            } description: {
                Text("Favorite some movies to see them here")
            }
        } else {
            List {
                ForEach(favorites) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteFavorites)
            }
        }
    }

    // MARK: - Private

    private func deleteFavorites(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = favorites[index]
            modelContext.delete(destination)
            try? modelContext.save()
        }
    }
}
