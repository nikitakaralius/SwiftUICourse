import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var birthdate: Date
    var areExtraNapkinsOn: Bool
    var areFrequentRefillsOn: Bool
}

extension User {
    static let empty = User(
        firstName: "",
        lastName: "",
        email: "",
        birthdate: Date.now,
        areExtraNapkinsOn: false,
        areFrequentRefillsOn: false)
}
