//
//  ListOfMoviesView.swift
//  Arquitecture_VIPER
//
//  Created by Cristian guillermo Romero garcia on 17/01/24.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController{
    private var moviesTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
        
    }()
    private let presenter: listOfMoviesPresentable
    
    init(presenter: listOfMoviesPresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setUpTableView()
        presenter.onViewAppear()
    }
    
    private func setUpTableView(){
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
}
extension ListOfMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
//        cell.backgroundColor = .red
        let model = presenter.viewModels[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }
}

extension ListOfMoviesView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}
extension ListOfMoviesView: ListOfMoviesUI{
    func update(movies: [ListOfMoviesViewModel]) {
        print("Datos recibidos: \(movies)")
        DispatchQueue.main.async{
            self.moviesTableView.reloadData()
        }
    }
    
    
}


