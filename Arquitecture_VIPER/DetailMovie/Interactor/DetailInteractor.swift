//
//  DetailInteractor.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 19/01/24.
//

import Foundation

protocol DetailInteractable: AnyObject{
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

    class DetailInteractor: DetailInteractable{
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=95013b7fc5a50ab2202eda61b68aca7a")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
