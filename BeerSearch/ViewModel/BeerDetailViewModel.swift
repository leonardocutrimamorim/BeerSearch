//
//  BeerDetailViewModel.swift
//  BeerSearch
//
//  Created by Leonardo Amorim on 22/12/2020.
//

import UIKit

final class BeerDetailViewModel {
    
    let name: String
    let tagline: String
    let description: String
    let image: UIImage
    
    init(name: String, tagline: String, description: String, image: UIImage) {
        self.name = name
        self.tagline = tagline
        self.description = description
        self.image = image
    }

}
