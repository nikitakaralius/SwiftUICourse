import SwiftUI

struct AppetizersLoader<Content: View>: View {
    @Binding private var isLoading: Bool
    private let loadedContent: Content
    
    init(isLoading: Binding<Bool>, @ViewBuilder loadedContent: () -> Content) {
        self.loadedContent = loadedContent()
        self._isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.brandPrimary)
                    .scaleEffect(1.3)
            } else {
                loadedContent
            }
        }
 
    }
}

struct AppetizersLoader_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersLoader(isLoading: .constant(true)) {
            Text("Hello")
        }
    }
}
