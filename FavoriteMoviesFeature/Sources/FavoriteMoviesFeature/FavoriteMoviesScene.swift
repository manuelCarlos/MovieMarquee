//
//  FavoriteMoviesScene.swift
//  FavoriteMoviesFeature
//
//  Created by Manuel Lopes on 16.10.24.
//

import SwiftUI
import SwiftData

import MoviesDB

@available(iOS 17, *)
public struct FavoriteMoviesScene: View {

    @State private var sortOrder = SortDescriptor(\FavoriteMovie.name)
    public let modelContext: ModelContext

    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    public var body: some View {
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
