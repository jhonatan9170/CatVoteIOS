//
//  DetailViewController.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 12/5/22.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var CatBredd:CatBreed!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var dislikeBtn: UIButton!
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catBreedLbl: UILabel!
    
    @IBOutlet weak var catDescription: UILabel!
    @IBOutlet weak var catTemperamentLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        catImage.load(urlString: CatBredd.urlImage)
        catBreedLbl.text =  CatBredd.name
        catTemperamentLbl.text = CatBredd.temperament
        catDescription.text = CatBredd.description
        self.title=CatBredd.name
        
        
    }

    @IBAction func dislikeBtnPressed(_ sender: Any) {
        createVote(isLike: false)
        
    }
    @IBAction func likeBtnPressed(_ sender: Any) {
        createVote(isLike: true)
    }
    func createVote(isLike:Bool){

        let newVote=CatBreedCD(context: context)
        newVote.id=CatBredd.id
        newVote.name=CatBredd.name
        newVote.like=isLike
        newVote.fecha=Date()
        do{
            try context.save()
            let alert = UIAlertController(title: "Valido", message: "Su voto se ha guardado",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar",style: .default))
            self.present(alert, animated: true, completion: nil)
            dislikeBtn.isHidden=true
            likeBtn.isHidden=true
        }catch{
            let alert = UIAlertController(title: "Error", message: "Su voto no se ha guardado",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar",style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
