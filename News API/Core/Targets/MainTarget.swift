//
//  MainTarget.swift
//  News API
//
//  Created by Eldor Makkambayev on 09.07.2021.
//

import Foundation
import Moya

enum MainTarget: TargetType {
    
    case articles(payloads: [String: Any], type: ArticlesType)
    
    var baseURL: URL {
        return URL(string: AppConfigs.baseUrl)!
    }

    var path: String {
        switch self {
        case .articles(_, let type):
            return type.rawValue
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .articles(let payloads, _):
            return .requestParameters(parameters: payloads, encoding: URLEncoding.queryString)
        }
    }

    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
    var headers: [String : String]? {
        return [:]
    }
}
