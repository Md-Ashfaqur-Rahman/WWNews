//
//  DetailsViewController.swift
//  WWNews
//
//  Created by Md Ashfaqur Rahman on 20/3/20.
//  Copyright © 2020 Md Ashfaqur Rahma. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var detailsImage: String?
    var detailsTitle: String?
    var detailsTime: String?
    var detailsPublisher: String?
    var detailsContent: String?
    var weburl: String?

    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsTitleView: UILabel!
    
    @IBOutlet weak var detailsTimeView: UILabel!
    
    @IBOutlet weak var detailsPublisherView: UILabel!
    
    @IBOutlet weak var detailsContentView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if detailsImage != nil{
            if let imageURL = URL(string: detailsImage!){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.detailsImageView.image = image
                        }
                    }
                }
            }
            
        }
        detailsTitleView.text = detailsTitle!
        detailsTimeView.text = detailsTime!
        detailsPublisherView.text = detailsPublisher!
        detailsContentView.text = detailsContent!
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickWebview(_ sender: UIButton) {
        performSegue(withIdentifier: "webView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendData = segue.destination as! WebViewController
        sendData.containWebURL = weburl
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
