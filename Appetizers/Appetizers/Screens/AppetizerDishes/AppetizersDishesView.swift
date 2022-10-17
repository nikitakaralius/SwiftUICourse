import SwiftUI

struct AppetizersDishesView: View {
    @ObservedObject var viewModel: AppetizerDishesViewModel
    
    var body: some View {
        AppetizersLoader(isLoading: $viewModel.isLoading) {
            ZStack {
                NavigationView {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerCellView(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                            }
                    }
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                    .navigationTitle("🥗 Dishes")
                }
                .blur(radius: viewModel.blurRadius)
                .navigationViewStyle(.stack)
                
                if viewModel.isShowingDetail {
                    AppetizerDetailView(
                        isShowing: $viewModel.isShowingDetail,
                        appetizer: viewModel.selectedAppetizer)
                }
            }
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
        AppetizersDishesView(
            viewModel: AppetizerDishesViewModel())
    }
}
