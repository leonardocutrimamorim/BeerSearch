//
//  BeerViewController.swift
//  BeerSearch
//
//  Created by Leonardo Amorim on 17/12/20.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    var beerViewModel = BeerViewModel()
//    var filteredBeers = [Beer]()

    let searchController = UISearchController(searchResultsController: nil)


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        beerViewModel.vc = self
        beerViewModel.getBeersAF()
        
        // Setup the Search Controller
        setupSearchController()
        
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search beer"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tableView.tableFooterView = UIView()
    }
   
    func filteredBeersToSearch(_ searchText: String) {
        beerViewModel.filteredBeers = beerViewModel.beers.filter({ (beer: Beer) -> Bool in
            return beer.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    
    
    
}




extension BeerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return beerViewModel.filteredBeers.count
        } else {
            return beerViewModel.beers.count
        }
        
       // beerViewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as? BeerCell
//        let beerModel = beerViewModel.beers[indexPath.row]
        
        let beerToShow: Beer
        
        if isFiltering() {
            beerToShow = beerViewModel.filteredBeers[indexPath.row]
        } else {
            beerToShow = beerViewModel.beers[indexPath.row]
        }
        
        cell?.beerName.text = beerToShow.name
        cell?.beerTagline.text = beerToShow.name
        
//        cell?.beerName.text = beerModel.name
//        cell?.beerTagline.text = beerModel.tagline
//        cell?.beerDescription.text = beerModel.welcomeDescription
        
        let photo = URL(string: "\(beerToShow.imageURL)")
        let scale = UIScreen.main.scale
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 115 * scale, height: 325 * scale))
        
        cell?.beerImage.kf.indicatorType = .activity
        cell?.beerImage.kf.setImage(with: photo, placeholder: nil, options: [.transition(ImageTransition.fade(1)), .processor(resizingProcessor)], progressBlock: nil)
        
        
        return cell!
    }
    
}



//extension BeerViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        var beerDetail: Beer
//        if isFiltering(){
//            beerDetail = beerViewModel.filteredBeers[indexPath.row]
//        } else {
//            beerDetail = beerViewModel.beers[indexPath.row]
//        }
//        performSegue(withIdentifier: "detailSegue", sender: beerDetail)
//
//    }
//}

extension BeerViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredBeersToSearch(searchController.searchBar.text!)
    }
    
    
}





