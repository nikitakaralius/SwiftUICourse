import SwiftUI

struct CloseButtonLabel: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}

struct CloseButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonLabel()
    }
}
