//
//  ListOfMoviesPresenter.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 17/01/24.
//

import Foundation
protocol listOfMoviesPresentable{
    var ui: ListOfMoviesUI? {get}
    var viewModels: [ListOfMoviesViewModel] {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
}
protocol ListOfMoviesUI: AnyObject{
    func update(movies: [ListOfMoviesViewModel])
}

class ListOfMoviesPresenter: listOfMoviesPresentable{
    
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: listOfMoviesInteractable
    var viewModels: [ListOfMoviesViewModel] = []
    private var models: [PopularMovieEntity] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouting
    
    init(listOfMoviesInteractor: listOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    func onViewAppear(){
        Task{
            models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
}
