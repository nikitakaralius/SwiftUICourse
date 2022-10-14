import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
           AppetizersDishesView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }

            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
