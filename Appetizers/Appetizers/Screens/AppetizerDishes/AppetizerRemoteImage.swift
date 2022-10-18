import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var loadedImage: Image?
    
    func load(from url: String, using service: AppetizerService = .shared) {
        service.loadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.loadedImage = Image(uiImage: uiImage)
            }
        }
    }
}

struct ImageWithPlaceholder: View {
    var targetImage: Image?
    var placeholder: Image
    
    var body: some View {
        targetImage?.resizable() ??
        placeholder.resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    @State var imageURL: String
    
    var body: some View {
        ImageWithPlaceholder(
            targetImage: imageLoader.loadedImage,
            placeholder: Image("food-placeholder"))
        .onAppear {
            imageLoader.load(from: imageURL)
        }
    }
}
