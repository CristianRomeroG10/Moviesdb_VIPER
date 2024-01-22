//
//  Mapper.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 19/01/24.
//

import Foundation

struct Mapper{
    func map(entity: PopularMovieEntity) -> ListOfMoviesViewModel {
        ListOfMoviesViewModel(title: entity.title,
                              overview: entity.overview,
                              imageURL:  URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
