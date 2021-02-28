//
//  RepoCell.swift
//  TherapBdCodingTest
//
//  Created by Mohammad Ashraful Islam Sadi on 28/2/21.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var repoTitleLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        favouriteButton.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func favouriteButtonPressed(byUser sender: UIButton) {
        favouriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }

}
