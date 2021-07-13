//
//  NetworkDataProvider.swift
//  News API
//
//  Created by Eldor Makkambayev on 09.07.2021.
//

import Moya
import Moya

protocol Networkable {
    var provider: MoyaProvider<MainTarget> { get }
    func fetchArticles(by keyword: String,
                       page: Int,
                       type: ArticlesType,
                       completion: @escaping (Result<Welcome, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<MainTarget>(plugins: [NetworkLoggerPlugin()])

    func fetchArticles(by keyword: String,
                       page: Int,
                       type: ArticlesType,
                       completion: @escaping (Result<Welcome, Error>) -> ()) {
        let payload: [String: Any] = ["q": keyword,
                                      "apiKey": AppConfigs.apiKey,
                                      "pageSize": 15,
                                      "page": page]
        request(target: .articles(payloads: payload, type: type),
                completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: MainTarget, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
