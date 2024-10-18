@available(iOS 13.0, *)
protocol WatchableDetail: Watchable {
    var genres: [Genre] { get }
    var productionCompanies: [ProductionCompany]? { get }
    var productionCountries: [ProductionCountry]? { get }
    var tagline: String? { get }
    var credits: Credits? { get }
    var spokenLanguages: [SpokenLanguage]? { get }
    var homepage: String? { get }
    var localizedRuntime: String? { get }
}
