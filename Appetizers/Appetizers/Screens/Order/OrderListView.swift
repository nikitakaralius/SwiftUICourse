import SwiftUI

struct OrderListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.hasAppetizers {
                    orderList
                } else {
                    emptyState
                }
            }
            .navigationTitle("💶 Orders")
        }
        .navigationViewStyle(.stack)
    }
    
    private var orderList: some View {
        VStack {
            List {
                let appetizers = Array(viewModel.appetizers.enumerated())
                ForEach(appetizers, id: \.offset) { _, appetizer in
                    AppetizerCellView(appetizer: appetizer)
                }
                .onDelete(perform: remoteAppetizer)
            }
            .listStyle(.plain)
            
            Spacer()

            Button {
                
            } label: {
                AppetizerButtonLabel(
                    "$\(viewModel.summary.formatted()) - Place to Order",
                    width: 320,
                    height: 50)
            }
            .padding(.bottom, 25)
        }
    }
    
    private var emptyState: some View {
        VStack {
            Image("list")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            Text("You have no items in your order")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
    }
    
    private func remoteAppetizer(at indexSet: IndexSet) {
        viewModel.appetizers.remove(atOffsets: indexSet)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(viewModel: viewModel)
    }
    
    static var viewModel: OrderListViewModel {
        let viewModel = OrderListViewModel()
        viewModel.appetizers = [] // MockData.appetizers + MockData.appetizers
        return viewModel
    }
}
