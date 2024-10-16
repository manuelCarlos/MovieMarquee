//
//  FavoriteButton.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftData
import SwiftUI

import MoviesDB

@available(iOS 17.0, *)
struct FavoriteButton: View {

    @State private var isFavorite: Bool?

    private let id: Int
    private let title: String?
    private let modelContext: ModelContext

    init(id: Int, title: String?, modelContext: ModelContext) {
        self.id = id
        self.title = title
        self.modelContext = modelContext
    }

    var body: some View {
        Button {
            if isFavorite == true {
                modelContext.delete(getObject(id: id)!)
            } else {
                modelContext.insert(FavoriteMovie(id: id, name: title!))
            }
            isFavorite?.toggle()
            try? modelContext.save()
        } label: {
            Image(
                systemName: isFavorite == true ? Icons.favoriteOn.rawValue : Icons.favoriteOff.rawValue
            )
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.red)
        }
        .onAppear {
            isFavorite = getObject(id: id) != nil
        }
    }

    func getObject(id: Int) -> FavoriteMovie? {
          do {
              let predicate: Predicate<FavoriteMovie>?  = #Predicate { movie in movie.id == id }
              var fetchDescriptor = FetchDescriptor<FavoriteMovie>(predicate: predicate)
              fetchDescriptor.fetchLimit = 1
              let object = try modelContext.fetch(fetchDescriptor)
              return object.first
          } catch {
              return nil
          }
      }

}
