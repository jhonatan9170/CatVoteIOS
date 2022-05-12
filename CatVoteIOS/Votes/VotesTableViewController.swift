//
//  VotesTableViewController.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 12/5/22.
//

import UIKit
import CoreData

class VotesTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var votes:[CatBreedCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Votes"
        getItems()

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return votes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vote =  votes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "voteCell", for: indexPath) as! VoteViewCell
        if vote.like {
            cell.likeImg.image=UIImage(systemName: "hand.thumbsup.fill")
        }else{
            cell.likeImg.image=UIImage(systemName: "hand.thumbsdown.fill")
            cell.likeImg.tintColor = .red
        }
        
        cell.nameLbl.text =  vote.name
        cell.dateLbl.text = "\(vote.fecha!.formatted())"

        return cell
    }
    func getItems(){
        do{
            votes = try context.fetch(CatBreedCD.fetchRequest())

            self.tableView.reloadData()
        }catch{
            
        }
        
    }
    func setLikeStyle()->UIImageView{
        let img = UIImageView()
        img.image=UIImage(systemName: "hand.thumbsup.fill")
        return img
    }
}
class VoteViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
}

