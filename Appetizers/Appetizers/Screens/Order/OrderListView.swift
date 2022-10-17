import SwiftUI

struct OrderListView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            VStack {
                if order.hasAppetizers {
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
                let appetizers = Array(order.appetizers.enumerated())
                ForEach(appetizers, id: \.offset) { _, appetizer in
                    AppetizerCellView(appetizer: appetizer)
                }
                .onDelete(perform: order.remove)
            }
            .listStyle(.plain)
            
            Spacer()

            Button {
                
            } label: {
                AppetizerButtonLabel(
                    "$\(order.summary.formatted()) - Place to Order",
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
                .multilineTextAlignment(.center)
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
            .environmentObject(Order())
    }
}
