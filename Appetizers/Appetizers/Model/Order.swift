import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    var summary: Double {
        appetizers.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }
   
    var hasAppetizers: Bool {
        !appetizers.isEmpty
    }
    
    func add(_ appetizer: Appetizer) {
        appetizers.append(appetizer)
    }
    
    func remove(at offsets: IndexSet) {
        appetizers.remove(atOffsets: offsets)
    }
}
