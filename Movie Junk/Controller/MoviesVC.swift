//
//  ViewController.swift
//  Movie Junk
//
//  Created by Omar on 11/25/19.
//  Copyright © 2019 Omar. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {
    
    @IBOutlet weak var moviesTable: UITableView!
    
    var moviesArr = [Movie]()
    private let cellIdentifier = "MovieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        moviesTable.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        moviesTable.delegate = self
        moviesTable.dataSource = self
        
        loadMovies()
    }
    
    func loadMovies() {
        Api.getMovies { (error, movie) in
            if let error = error {
                print(error.localizedDescription)
            } else if let movie = movie {
                DispatchQueue.main.async {
                    self.moviesArr = movie
                    self.moviesTable.reloadData()
                }
            }
        }
    }


}

extension MoviesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieCell
        cell.configureCell(movie: moviesArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
