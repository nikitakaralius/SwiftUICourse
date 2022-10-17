import SwiftUI

protocol OrderList {
    func add(appetizer: Appetizer)
}

final class OrderListViewModel: ObservableObject, OrderList {
    @Published var appetizers: [Appetizer] = []
    
    var summary: Double {
        appetizers.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }
    
    func add(appetizer: Appetizer) {
        appetizers.append(appetizer)
    }
}
