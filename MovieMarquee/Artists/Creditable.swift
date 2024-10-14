protocol Creditable: Codable {
    var id: Int { get }
    func getTitle() -> String
    func getImagePath() -> String
    func getKnownForDepartment() -> String?
    func getPosterUrl() -> String
}