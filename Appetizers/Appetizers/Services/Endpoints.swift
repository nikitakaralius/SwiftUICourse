import Foundation

extension URL {
    static var appetizers: URL { .makeForEndpoint("appetizers") }
    
    private static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/")!
    }
}
