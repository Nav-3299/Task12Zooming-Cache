//
//  NetworkManager.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//



import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func callApi<T:Decodable>(callType : T.Type , url : String , completionHandler : @escaping (T)->()){
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let data = data{
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(callType , from: data)
                    completionHandler(result)
                }catch{
                    print(error)
                    return
                }
            }
        }.resume()
   
    }
}
