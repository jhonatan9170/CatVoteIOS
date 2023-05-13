//
//  HomeViewController.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 11/5/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var catsBreed:[CatBreed]=[]
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var CatsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        setupDelegates()
        viewModel.getCats()
    }
    
    func setupDelegates(){
        CatsListTableView.dataSource=self
        CatsListTableView.delegate=self
        viewModel.delegate = self
    }

}
extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catsBreed.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath) as! CatTableViewCell
         let cat = catsBreed[indexPath.row]
        cell.CatBreedLabel.text =  cat.name
        cell.CatOriginLabel.text = cat.origin
        cell.CatImage.load(urlString:cat.urlImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let new = story.instantiateViewController(withIdentifier: "detail") as! DetailViewController

        new.CatBredd = catsBreed[indexPath.row]

        self.navigationController?.pushViewController(new, animated: true)
       // performSegue(withIdentifier: "goDetail", sender: countrys[indexPath.row])
    }
    
    
}

extension HomeViewController: HomeDelegate{
    func didGetData(cats: [CatBreed]) {
        
        self.catsBreed = cats
        CatsListTableView.reloadData()
    }
    
    func error(error: Error) {
        print("errores")
    }

}
    

class CatTableViewCell: UITableViewCell {
    @IBOutlet weak var CatBreedLabel: UILabel!
    @IBOutlet weak var CatOriginLabel: UILabel!
    @IBOutlet weak var CatImage: UIImageView!
    
}
