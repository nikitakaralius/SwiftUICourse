import SwiftUI

final class AppetizerDishesViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isPresentingAlert = false
    @Published var alert: AlertDescription? {
        didSet {
            isPresentingAlert = true
        }
    }
    
    func loadAppetizers(using service: AppetizerService = .shared) {
        service.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    assignAlertDescription(from: error)
                }
            }
        }
    }
    
    private func assignAlertDescription(from error: AppetizerService.APIError) {
        switch error {
        case .invalidResponse:
            alert = .invalidResponse
        case .invalidData:
            alert = .invalidData
        case .unableToComplete:
            alert = .unableToComplete
        }
    }
}
