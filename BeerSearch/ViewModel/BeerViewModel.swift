//
//  BeerViewModel.swift
//  BeerSearch
//
//  Created by Leonardo Amorim on 17/12/20.
//

import Foundation
import Alamofire

final class BeerViewModel {
    
    weak var vc: BeerViewController?
    var beers = [Beer]()
    var filteredBeers = [Beer]()
    
    func getBeersAF(){
        AF.request("https://api.punkapi.com/v2/beers")
            .response { response in
                if let data = response.data {
                    do {
                        let userResponse = try JSONDecoder().decode([Beer].self, from: data)
                        for beer in userResponse{
                            self.beers.removeAll()
                            self.beers.append(contentsOf: userResponse)
                        }
                        print(self.beers)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            }
    }
    
//    func getBeers() {
//        URLSession.shared.dataTask(with: URL(string: "https://api.punkapi.com/v2/beers")!) { (data, response, error) in
//            if error == nil {
//                if let data = data {
//                    do {
//                        let userResponse = try JSONDecoder().decode([Beer].self, from: data)
//                        for beer in userResponse{
//                            self.beers.removeAll()
//                            self.beers.append(contentsOf: userResponse)
//                        }
//                        print(self.beers)
//                        DispatchQueue.main.async {
//                            self.vc?.tableView.reloadData()
//                        }
//                    } catch let err {
//                        print(err.localizedDescription)
//                    }
//                }
//            } else {
//                print(error?.localizedDescription)
//            }
//        }.resume()
//    }
    
}
