import SwiftUI

struct AppetizersDishesView: View {
    var body: some View {
        NavigationView {
            Text("Dishes View")
                .navigationTitle("🥗 Dishes")
        }
    }
}

struct AppetizersDishesView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersDishesView()
    }
}
