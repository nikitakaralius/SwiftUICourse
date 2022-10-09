import SwiftUI

struct AFButtonLabel: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
    }
}

struct AFButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        AFButtonLabel(title: "Learn More")
    }
}
