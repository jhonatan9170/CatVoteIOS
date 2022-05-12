//
//  ResponseModel.swift
//  CatVoteIOS
//
//  Created by Jhonatan  Chavez on 11/5/22.
//


import Foundation

// MARK: - ResponseModel
struct ResponseListModel:Decodable {
    let weight: Weight
    let description:String
    let id, name: String
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament, origin : String
    let countryCodes,countryCode:String?
    let welcomeDescription, lifeSpan: String?
    let indoor, lap: Int?
    let altNames: String?
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    let energyLevel, grooming, healthIssues, intelligence: Int?
    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    let experimental, hairless, natural, rare: Int?
    let rex, suppressedTail, shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int
    let referenceImageID: String?
    let image: Image?
}

// MARK: - Image
struct Image:Decodable {
    let id: String?
    let width, height: Int?
    let url: String?
}

// MARK: - Weight
struct Weight:Decodable {
    let imperial, metric: String
}
