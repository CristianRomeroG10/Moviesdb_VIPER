//
//  DetailPresenter.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 19/01/24.
//

import Foundation
protocol DetailPresenterUI: AnyObject{
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject{
    var ui: DetailPresenterUI? {get}
    var movieId: String {get}
    func onViewAppear()
}

class DetailPresenter: DetailPresentable{
    weak var ui: DetailPresenterUI?
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    
    init(movieId: String, interactor: DetailInteractable, mapper: MapperDetailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            print(viewModel)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
    
}
