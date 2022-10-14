import SwiftUI

struct AppetizersDishesView: View {
    @State var appetizers: [Appetizer]
    
    var body: some View {
        NavigationView {
            List(appetizers, rowContent: { appetizer in
                AppetizerCellView(appetizer: appetizer)
            })
            .navigationTitle("🥗 Dishes")
        }
    }
}

struct AppetizersDishesView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersDishesView(appetizers: MockData.appetizers)
    }
}
