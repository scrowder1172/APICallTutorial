//
//  WebServiceClass.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import Foundation

final class WebService {
    func downloadData<T: Codable>(fromURL: String) async throws -> T? {
        
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
            
        } catch NetworkError.badURL {
            throw NetworkError.badURL
        } catch NetworkError.badResponse {
            throw NetworkError.badResponse
        } catch NetworkError.badStatus {
            throw NetworkError.badStatus
        } catch NetworkError.failedToDecodeResponse {
            throw NetworkError.failedToDecodeResponse
        } catch {
            print("Unknown decode error: \(error.localizedDescription)")
            throw NetworkError.unknownError
        }
    }
    
    func simulateNetworkSleep() async {
        let delay: Int = Int.random(in: 1...3)
        do {
            try await Task.sleep(nanoseconds: UInt64(delay) * 1_000_000_000)
        } catch {
            print("Error simulating network sleep: \(error.localizedDescription)")
        }
    }
}
