//
//  NetworkManager.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/19/25.
//

import Foundation

enum DataSource {
    static func request<T: Decodable>(api: API, type: T.Type) async throws -> T {
        guard let url = URL(string: api.url) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = api.httpMethod.rawValue

        // If the API case has an httpBody, encode it and set it
        if let body = api.httpBody {
            request.httpBody = try JSONEncoder().encode(body)

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)
        print(response)

        let json = String(data: data, encoding: .utf8)

        if let httpResponse = response as? HTTPURLResponse, !(200 ... 299).contains(httpResponse.statusCode) {
            print("debug", httpResponse)
            throw URLError(URLError.Code(rawValue: httpResponse.statusCode))
        }

        let decodedData = try JSONDecoder().decode(type, from: data)
        return decodedData
    }
}

protocol API {
    var url: String { get }
    var httpMethod: HttpMethod { get }
    var httpBody: Encodable? { get }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "Delete"
    case patch = "Patch"
}
