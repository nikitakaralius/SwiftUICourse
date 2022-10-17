import SwiftUI

struct AppetizersTabView: View {
    @StateObject private var dishesViewModel = AppetizerDishesViewModel()
    
    var body: some View {
        TabView {
            AppetizersDishesView(viewModel: dishesViewModel)
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
        .onAppear {
            dishesViewModel.loadAppetizers()
        }
    }
}

struct AppetizersTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
