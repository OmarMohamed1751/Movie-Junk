//
//  APIManager.swift
//  Movie Junk
//
//  Created by Omar on 11/25/19.
//  Copyright © 2019 Omar. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    static func getMovies(completion : @escaping (_ error : Error?, _ movies : [Movie]?) -> Void) {
        let url = URLs.moviesURL
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure:
                guard let error = response.error else {return}
                print(error.localizedDescription)
                completion(error, nil)
                
            case .success:
                guard let data = response.data else {return}
                let decoder = JSONDecoder()
                do {
                    let decodedMovies = try decoder.decode([Movie].self, from: data)
                    completion(nil, decodedMovies)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
