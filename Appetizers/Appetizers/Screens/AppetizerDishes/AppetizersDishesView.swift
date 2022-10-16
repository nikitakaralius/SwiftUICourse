import SwiftUI

struct AppetizersDishesView: View {
    @StateObject private var viewModel = AppetizerDishesViewModel()
    
    var body: some View {
        NavigationView {
            AppetizersLoader(isLoading: $viewModel.isLoading) {
                ZStack {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerCellView(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                            }
                    }
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                    .blur(radius: viewModel.blurRadius)
                    .navigationTitle("🥗 Dishes")
                    
                    if viewModel.isShowingDetail {
                        AppetizerDetailView(
                            isShowing: $viewModel.isShowingDetail,
                            appetizer: viewModel.selectedAppetizer)
                    }
                }
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
