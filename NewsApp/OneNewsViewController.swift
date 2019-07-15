//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Horbach on 15.04.19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import UIKit
import SafariServices
class OneNewsViewController: UIViewController {
    
    var index = 0
    
    var article: Article!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var labelAuthor: UILabel!
    
    @IBOutlet weak var labelSource: UILabel!
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url) {
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = article.title
        labelDescription.text =  article.description
        labelSource.text = article.sourceName
        labelAuthor.text = article.author
        
        DispatchQueue.main.async {
            if let ulr = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: ulr) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }

}
