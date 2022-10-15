import SwiftUI

struct AppetizersDishesView: View {
    @StateObject private var viewModel = AppetizerDishesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.brandPrimary)
                        .scaleEffect(1.3)
                }

                List(viewModel.appetizers, rowContent: { appetizer in
                    AppetizerCellView(appetizer: appetizer)
                })
                .navigationTitle("🥗 Dishes")
            }
        }
        .onAppear {
            viewModel.loadAppetizers()
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

struct AppetizersDishesView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersDishesView()
    }
}
