//
//  MovieCell.swift
//  Movie Junk
//
//  Created by Omar on 11/25/19.
//  Copyright © 2019 Omar. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
    }
    
    func configureCell(movie: Movie) {
        movieImg.sd_setImage(with: URL(string: movie.image!), placeholderImage: UIImage(named: "movie"))
        movieName.text = movie.title
        if let movieRate = movie.rating {
            self.movieRate.text = "\(movieRate)"
        }
        if let releaseYear = movie.releaseYear {
            self.movieYear.text = "\(releaseYear)"
        }
        if let genre = movie.genre {
            self.movieGenre.text = "\(genre)"
        }
    }
    
}
