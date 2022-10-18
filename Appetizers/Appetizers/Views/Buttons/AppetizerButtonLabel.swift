import SwiftUI

struct AppetizerButtonLabel: View {
    private let text: String
    var width: CGFloat
    var height: CGFloat
    
    init(_ text: String, width: CGFloat = 260, height: CGFloat = 50) {
        self.text = text
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: width, height: height)
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
