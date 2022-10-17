import SwiftUI

struct AlertDescription: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

extension AlertDescription {
    static let unableToComplete = AlertDescription(
        title: Text("Server Error"),
        message: Text("Oops, something went wrong. Please check your Internet connection."),
        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertDescription(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again or contact support."),
        dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertDescription(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK")))
}

extension AlertDescription {
    static func emptyField(required field: String) -> AlertDescription {
        AlertDescription(
            title: Text("Empty field"),
            message: Text("Please ensure \(field) field in the form has been filled out."),
            dismissButton: .default(Text("OK")))
    }
    
    static let invalidEmail = AlertDescription(
        title: Text("Invalid Email"),
        message: Text("Please ensure your email is correct."),
        dismissButton: .default(Text("OK")))
}
