import SwiftUI
import SafariServices


struct SafariView: UIViewControllerRepresentable {
    typealias SafariContext = UIViewControllerRepresentableContext<SafariView>
    
    let url: URL
    
    func makeUIViewController(context: SafariContext) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: SafariContext) {
        
    }
}
