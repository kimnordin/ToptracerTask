//
//  Services.swift
//  ToptracerTask
//
//  Created by Kim Nordin on 2022-05-24.
//

import Foundation
import UIKit

class Service {
    func fetchGif(completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=9K6c17yMxo0S9zFRRxVHlL50YVuNNvht") else {return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }

                if let giphyImage = UIImage(data: data) {
                    completion(.success(giphyImage))
                }
            }
        }.resume()
    }
}
