import SwiftUI

struct AppetizerCellView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
           Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price.formatted())")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCellView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCellView(appetizer: MockData.sampleAppetizer)
    }
}
