import SwiftUI

final class AppetizerDishesViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = [] {
        didSet {
            isLoading = false
        }
    }
    @Published var alert: AlertDescription?
    @Published var isLoading = false
    
    func loadAppetizers(using service: AppetizerService = .shared) {
        isLoading = true
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
