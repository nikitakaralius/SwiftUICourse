import SwiftUI

final class AppetizerDishesViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alert: AlertDescription?
    @Published var selectedAppetizer: Appetizer! {
        didSet {
            isShowingDetail = true
        }
    }
    
    @Published var isLoading = false
    @Published var isShowingDetail = false
    
    var blurRadius: CGFloat {
        isShowingDetail ? 20 : 0
    }
    
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
                isLoading = false
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
