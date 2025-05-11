//
//  DetailArticleVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit
import SDWebImage

class DetailArticleVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var publishDate: UILabel!
    
    let vm = DetailArticleVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        imgView.sd_setImage(
            with: URL(string: vm.detailListArticle.imageUrl),
            placeholderImage: UIImage(named: "empty"),
            options: [],
            completed: { image, error, cacheType, url in
                if error != nil {
                    // Gagal load image dari URL, set gambar default
                    self.imgView.image = UIImage(named: "empty")
                }
            }
        )
        
        titleDetail.text = vm.detailListArticle.title
        textViewSummary.text = vm.detailListArticle.summary.firstSentence()
        publishDate.text = "Published at: \(vm.detailListArticle.publishedAt.formattedDate()) WIB"
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
