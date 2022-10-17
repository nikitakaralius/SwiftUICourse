import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date.now
    @Published var areExtraNapkinsOn = false
    @Published var areFrequentRefillsOn = false
    @Published var alertDescription: AlertDescription?
    
    func saveChanges() {
        validate()
    }
    
    private func validate() {
        guard !firstName.isEmpty else {
            alertDescription = .emptyField(required: "First Name")
            return
        }
        
        guard !lastName.isEmpty else {
            alertDescription = .emptyField(required: "Last Name")
            return
        }
        
        guard !email.isEmpty else {
            alertDescription = .emptyField(required: "Email")
            return
        }
        
        guard email.isValidEmail else {
            alertDescription = .invalidEmail
            return
        }
        
        alertDescription = nil
    }
}
