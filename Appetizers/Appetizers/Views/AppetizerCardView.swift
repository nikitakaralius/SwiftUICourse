import SwiftUI

struct AppetizerCardView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
           Image("asian-flank-steak")
                .resizable()
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title3)
                    .bold()
                
                Text("$\(appetizer.price.formatted())")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct AppetizerPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCardView(appetizer: MockData.sampleAppetizer)
    }
}
