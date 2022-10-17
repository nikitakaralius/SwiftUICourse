import SwiftUI

struct OrderListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.appetizers, rowContent: { appetizer in
                    AppetizerCellView(appetizer: appetizer)
                })
                .listStyle(.plain)

                Spacer()
                
                Button {
                    
                } label: {
                    AppetizerButtonLabel(
                        "$\(viewModel.summary.formatted()) - Place to Order",
                        width: 320,
                        height: 50)
                    .padding()
                }
            }
            .navigationTitle("💶 Orders")
        }
        .navigationViewStyle(.stack)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(viewModel: viewModel)
    }
    
    static var viewModel: OrderListViewModel {
        let viewModel = OrderListViewModel()
        viewModel.appetizers = MockData.appetizers + MockData.appetizers
        return viewModel
    }
}
