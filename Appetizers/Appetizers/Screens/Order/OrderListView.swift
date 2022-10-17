import SwiftUI

struct OrderListView: View {
    var body: some View {
        NavigationView {
            Text("Order View")
                .navigationTitle("💶 Orders")
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
