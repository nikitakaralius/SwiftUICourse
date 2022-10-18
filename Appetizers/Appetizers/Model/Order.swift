import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    var summary: Double {
        appetizers.reduce(0) { $0 + $1.price }
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
