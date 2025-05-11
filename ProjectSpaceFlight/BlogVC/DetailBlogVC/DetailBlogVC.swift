//
//  DetailBlogVC.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import UIKit
import SDWebImage

class DetailBlogVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var publishDate: UILabel!
    
    let vm = DetailBlogVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        imgView.sd_setImage(
            with: URL(string: vm.detailListBlog.imageUrl),
            placeholderImage: UIImage(named: "empty"),
            options: [],
            completed: { image, error, cacheType, url in
                if error != nil {
                    // Gagal load image dari URL, set gambar default
                    self.imgView.image = UIImage(named: "empty")
                }
            }
        )
        
        titleDetail.text = vm.detailListBlog.title
        textViewSummary.text = vm.detailListBlog.summary.firstSentence()
        publishDate.text = "Published at: \(vm.detailListBlog.publishedAt.formattedDate()) WIB"
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
