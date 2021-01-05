//
//  ViewController.swift
//  Search
//
//  Created by Yatharth Mahawar on 1/4/21.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController,SearchManagerDelegate,UISearchTextFieldDelegate,UISearchBarDelegate{

    var arr1 =  [Artist]()
    var searchManager = SearchManager()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchManager.delegate = self
        let artistSearchBar = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = artistSearchBar
        artistSearchBar.searchBar.delegate = self
        
            
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchManager.getData(searchName: searchBar.text!)
        self.arr1 = []
    }
    
//    @IBAction func searchButton(_ sender: UIButton) {
//        if self.searchTextField.text == "" {
//            let alert = UIAlertController(title: "Enter Artist Name", message: "", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default, handler: .none)
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//
//        }
//        else {
//            searchManager.getData(searchName: searchTextField.text!)
//            self.arr1 = []
//        }
//    }
    
    func didUpdateData(data: JSON) {
        for arr in data.arrayValue {
            self.arr1.append(Artist(json: arr))
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! CustomTableViewCell
        cell.artistName.text = arr1[indexPath.row].trackName
        cell.trackName.text = arr1[indexPath.row].artistName
        cell.artworkImage.kf.setImage(with: URL(string: arr1[indexPath.row].artwork))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

