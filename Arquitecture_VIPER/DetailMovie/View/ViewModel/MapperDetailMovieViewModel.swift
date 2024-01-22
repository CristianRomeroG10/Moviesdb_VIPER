//
//  MapperDetailMovieViewModel.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 21/01/24.
//

import Foundation

struct MapperDetailMovieViewModel{
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel{
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
