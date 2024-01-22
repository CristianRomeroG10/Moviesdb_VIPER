//
//  DetailMovieEntity.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 21/01/24.
//
import Foundation

struct DetailMovieEntity: Codable{
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
