import SwiftUI

struct AppetizersTabView: View {
    @StateObject private var dishesViewModel = AppetizerDishesViewModel()
    @StateObject private var accountViewModel = AccountViewModel()
    
    var body: some View {
        TabView {
            AppetizersDishesView(viewModel: dishesViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView(viewModel: accountViewModel)
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
            accountViewModel.retrieveUser()
        }
    }
}

struct AppetizersTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
