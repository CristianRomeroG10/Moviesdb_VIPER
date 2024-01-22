//
//  ListOfMoviesInteractor.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 17/01/24.
//

import Foundation
//95013b7fc5a50ab2202eda61b68aca7a

protocol listOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}


class ListOfMoviesInteractor: listOfMoviesInteractable{
    func getListOfMovies() async -> PopularMovieResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=95013b7fc5a50ab2202eda61b68aca7a")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: listOfMoviesInteractable{
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Cris suscribete", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 1, title: "Cris suscribete", overview: "Aprende SwiftUI", imageURL: "", votes: 10),
            .init(id: 2, title: "Cris suscribete", overview: "Aprende Xcode", imageURL: "", votes: 10),
            .init(id: 3, title: "Cris suscribete", overview: "Aprende UIKit", imageURL: "", votes: 10),
            .init(id: 4, title: "Cris suscribete", overview: "Aprende Firebase", imageURL: "", votes: 10),
            .init(id: 5, title: "Cris suscribete", overview: "Aprende Combine", imageURL: "", votes: 10),
        ])
    }
    
    
}
