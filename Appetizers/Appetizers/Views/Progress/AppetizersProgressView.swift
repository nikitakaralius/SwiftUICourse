import SwiftUI

struct AppetizersProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.brandPrimary)
            .scaleEffect(1.3)
    }
}

struct AppetizersProgressView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersProgressView()
    }
}
