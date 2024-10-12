import CoreData

protocol FavoriteStorage {

    var viewContext: NSManagedObjectContext { get }

    func saveContext()
    func addFavorite(id: Int, name: String)
    func deleteFavorite(id: Int)
    func isFavorite(id: Int) -> Bool
}

