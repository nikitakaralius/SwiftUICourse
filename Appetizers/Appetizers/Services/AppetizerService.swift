import Foundation
import UIKit

fileprivate struct GetAppetizersResponse: Decodable {
    let request: [Appetizer]
}

final class AppetizerService {
    enum APIError: Error {
        case invalidResponse,
             invalidData,
             unableToComplete
    }
    
    typealias GetAppetizersHandler = (Result<[Appetizer], APIError>) -> Void
    typealias LoadImageHandler = (UIImage?) -> Void
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    static let shared = AppetizerService()
    
    func getAppetizers(then complete: @escaping GetAppetizersHandler,
                       using session: URLSession = .shared) {
        let task = session.dataTask(with: .appetizers) { data, response, error in
            guard error == nil else {
                complete(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                complete(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complete(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let appetizers = try decoder.decode(GetAppetizersResponse.self, from: data)
                complete(.success(appetizers.request))
            } catch {
                complete(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func loadImage(from url: String,
                   then complete: @escaping LoadImageHandler,
                   using session: URLSession = .shared) {
        
        let imageKey = NSString(string: url)
        
        if let image = imageCache.object(forKey: imageKey) {
            complete(image)
            return
        }
        
        guard let url = URL(string: url) else {
            complete(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                complete(nil)
                return
            }
            self.imageCache.setObject(image, forKey: imageKey)
            complete(image)
        }
        
        task.resume()
    }
}
