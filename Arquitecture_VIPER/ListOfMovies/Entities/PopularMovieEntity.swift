//
//  PopularMovieEntity.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 17/01/24.
//

import Foundation

struct PopularMovieEntity: Codable{
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
