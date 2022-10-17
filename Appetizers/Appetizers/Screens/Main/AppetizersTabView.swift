import SwiftUI

struct AppetizersTabView: View {
    @StateObject private var dishesViewModel = AppetizerDishesViewModel()
    @StateObject private var accountViewModel = AccountViewModel()
    @StateObject private var orderListViewModel = OrderListViewModel()
    
    var body: some View {
        TabView {
            AppetizersDishesView(
                viewModel: dishesViewModel,
                orderList: orderListViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView(viewModel: accountViewModel)
                .tabItem {
                    Label("Account", systemImage: "person")
                }

            OrderListView(viewModel: orderListViewModel)
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
