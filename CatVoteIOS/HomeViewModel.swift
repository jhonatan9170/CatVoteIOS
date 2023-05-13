//
//  HomeViewModel.swift
//  CatVoteIOS
//
//  Created by Jhonatan chavez chavez on 12/05/23.
//

import Foundation


protocol HomeDelegate:AnyObject {
    func didGetData(cats: [CatBreed])
    func error(error: Error)
}

class HomeViewModel {
    
    weak var delegate: HomeDelegate?
    
    func getCats() {
        HomeTask.doRequest(url:ConnectionParameters.endpointList,responsetype: [ResponseListModel].self, completion: { [weak self] result in
            
            guard let self = self else{
                return
            }
            
            switch result{
            case .success(let Cats):
                let cats = self.convertToCatModel(with: Cats)
                self.delegate?.didGetData(cats: cats!)
            case .failure(let error):
                self.delegate?.error(error: error)
                print(error)
            }
        })
    }

    func convertToCatModel(with catResponse:[ResponseListModel])-> [CatBreed]{
        var cats: [CatBreed] = []
        for catBreed in catResponse {
            let newCatBreed = CatBreed(id: catBreed.id,
                                       name: catBreed.name,
                                       temperament: catBreed.temperament,
                                       urlImage: catBreed.image?.url ?? "",
                                       description: catBreed.description ,
                                       origin: catBreed.origin)
            cats.append(newCatBreed)
        }
        return cats
    }
}
