import Foundation

public protocol HttpPostClient {
    func post(to: URL, with data: Data?, completion: @escaping (HttpError) -> Void)
}

