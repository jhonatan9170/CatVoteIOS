//
//  HomeViewController.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 11/5/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var catsBreed:[CatBreed]=[]
    
    @IBOutlet weak var CatsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CatsListTableView.dataSource=self
        CatsListTableView.delegate=self
        self.title = "Cats"
        
        HomeTask.doRequest(url:ConnectionParameters.endpointList,responsetype: [ResponseListModel].self, completion: { result in
            switch result{
            case .success(let Cats):
                self.reloadData(with: Cats)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func reloadData(with catResponse:[ResponseListModel]){
        for catBreed in catResponse {
            let newCatBreed = CatBreed(id: catBreed.id,
                                       name: catBreed.name,
                                       temperament: catBreed.temperament,
                                       urlImage: catBreed.image?.url ?? "",
                                       description: catBreed.description ,
                                       origin: catBreed.origin)
            catsBreed.append(newCatBreed)
        }
        CatsListTableView.reloadData()
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

class CatTableViewCell: UITableViewCell {
    @IBOutlet weak var CatBreedLabel: UILabel!
    @IBOutlet weak var CatOriginLabel: UILabel!
    @IBOutlet weak var CatImage: UIImageView!
    
}
