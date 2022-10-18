import SwiftUI

@main
struct AppetizersApp: App {
    let order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizersTabView()
                .environmentObject(order)
        }
    }
}
