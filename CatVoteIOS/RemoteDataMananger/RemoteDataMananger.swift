//
//  RemoteDataMananger.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 11/5/22.
//
import Foundation
    struct ConnectionParameters {
        static let api_key = "37038feb-a80a-45d6-bed2-1cb5a8a70fe0"
        static let endpointList = "https://api.thecatapi.com/v1/breeds?api_key=\(api_key)"
     }

    class HomeTask {
        static func doRequest<T:Decodable>(url:String,responsetype:T.Type,completion: @escaping (Result<T, Error>) -> Void) {
            let url = URL(string:url)!
            var request = URLRequest(url: url)

            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    do {
                        let responseDTO = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(responseDTO))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
