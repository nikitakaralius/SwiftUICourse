import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            DismissButton(isShowing: $isShowingDetailView)
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding()
                .font(.body)
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                AFButtonLabel(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            let url = URL(string: framework.url) ?? URL(string: "www.apple.com")!
            SafariView(url: url)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true))
    }
}
