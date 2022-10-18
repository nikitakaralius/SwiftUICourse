import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var user: User = .empty
    @Published var alertDescription: AlertDescription?
    
    @AppStorage("user") private var userData: Data?
    
    func saveChanges() {
        validate()
        tryToSaveUser(hasAlert: alertDescription != nil)
    }
    
    func retrieveUser() {
        guard let userData = userData else {
            user = .empty
            return
        }
        
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: userData)
        } catch {
            alertDescription = .invalidUserData
        }
    }
    
    private func validate() {
        guard !user.firstName.isEmpty else {
            alertDescription = .emptyField(required: "First Name")
            return
        }
        
        guard !user.lastName.isEmpty else {
            alertDescription = .emptyField(required: "Last Name")
            return
        }
        
        guard !user.email.isEmpty else {
            alertDescription = .emptyField(required: "Email")
            return
        }
        
        guard user.email.isValidEmail else {
            alertDescription = .invalidEmail
            return
        }
        
        alertDescription = nil
    }
    
    private func tryToSaveUser(hasAlert: Bool) {
        guard !hasAlert else { return }
        
        do {
            let encoder = JSONEncoder()
            let encodedUser = try encoder.encode(user)
            userData = encodedUser
            alertDescription = .userSaveSuccess
        } catch {
            alertDescription = .invalidUserData
        }
    }
}
