import SwiftUI

struct DismissButton: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(isShowing: .constant(true))
    }
}
