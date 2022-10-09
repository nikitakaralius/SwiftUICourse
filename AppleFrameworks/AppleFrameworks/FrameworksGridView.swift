import SwiftUI

struct FrameworksGridView: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()),
                                    count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            FrameworkTitleView(framework: MockData.sampleFramework)
            FrameworkTitleView(framework: MockData.sampleFramework)
            FrameworkTitleView(framework: MockData.sampleFramework)
            FrameworkTitleView(framework: MockData.sampleFramework)
            FrameworkTitleView(framework: MockData.sampleFramework)
            FrameworkTitleView(framework: MockData.sampleFramework)
        }
    }
}

struct FrameworksGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworksGridView()
    }
}
