import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date.now
    @Published var areExtraNapkinsOn = false
    @Published var areFrequentRefillsOn = false
}
