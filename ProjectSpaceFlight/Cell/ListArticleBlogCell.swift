//
//  ListArticleBlogCell.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit
import SDWebImage

class ListArticleBlogCell: UITableViewCell {

    @IBOutlet weak var imgViewCell: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func setupCell (data: NewsArticle) {
        imgViewCell.sd_setImage(
            with: URL(string: data.imageUrl),
            placeholderImage: UIImage(named: "empty"),
            options: [],
            completed: { image, error, cacheType, url in
                if error != nil {
                    // Gagal load image dari URL, set gambar default
                    self.imgViewCell.image = UIImage(named: "empty")
                }
            }
        )
        
        title.text = data.title
        category.text = data.newsSite
    }
}
