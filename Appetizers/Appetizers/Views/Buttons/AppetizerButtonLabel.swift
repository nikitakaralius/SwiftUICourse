import SwiftUI

struct AppetizerButtonLabel: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(8)
    }
}

struct AppetizerButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButtonLabel("Some text goes here")
    }
}
