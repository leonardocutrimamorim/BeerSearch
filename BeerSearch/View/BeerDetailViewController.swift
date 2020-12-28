//
//  BeerDetailViewController.swift
//  BeerSearch
//
//  Created by Leonardo Amorim on 21/12/2020.
//

import UIKit

class BeerDetailViewController: UIViewController {
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    var beerDetailVM: BeerDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        beerName.text = beerDetailVM.name
        beerTagline.text = beerDetailVM.tagline
        beerDescription.text = beerDetailVM.description
    }
    


}
