//
//  APIService.swift
//  AsyncAwaitSample
//
//  Created by Siddharth Kothari on 28/06/23.
//

import Foundation

final class APIService {
    
    static let shared = APIService()
    private init() {}
    
    func getUser() async throws -> GitUser {
        let endpoint = "https://api.github.com/users/siddharth-kothari-spk"
        
        guard let url = URL(string: endpoint) else {
            throw  GitUserError.invalidURL
        }
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitUserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitUser.self, from: data)
        }
        catch {
            throw GitUserError.invalidData
        }
    }
}
