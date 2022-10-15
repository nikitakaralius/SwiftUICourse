import SwiftUI

final class AppetizerDishesViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func loadAppetizers(using service: AppetizerService = .shared) {
        service.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
}
