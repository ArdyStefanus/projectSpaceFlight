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
        let url = URL.init(string: data.imageUrl)
        imgViewCell.sd_setImage(with: url, placeholderImage: UIImage(contentsOfFile: "empty"))
        title.text = data.title
        category.text = data.newsSite
    }
}
