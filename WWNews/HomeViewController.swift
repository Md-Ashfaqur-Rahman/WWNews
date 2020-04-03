//
//  HomeViewController.swift
//  WWNews
//
//  Created by Md Ashfaqur Rahman on 20/3/20.
//  Copyright © 2020 Md Ashfaqur Rahma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var flag_BarButtonItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var myIndex: Int?
    var ArticleArray = [Article]()
    var source = "country=us"
    
    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let button = UIButton(type: .custom)
//        //set image for button
//        button.setImage(UIImage(named: "us"), for: .normal)
//        //add function for button
//        //set frame
//        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
//
//        let barButton = UIBarButtonItem(customView: button)
//        //assign button to navigationbar
//        self.navigationItem.rightBarButtonItem = barButton
        
        
        fetchArticlesJSON(fromSource: source)
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        
    }
    

    @IBAction func didTapCountry(_ sender: UIBarButtonItem) {
        
        guard let CountryViewController = storyboard?.instantiateViewController(withIdentifier: "CountryViewController") as? CountryViewController else { return }
        CountryViewController.didTapCountryType = { countryType in
            self.transitionToNewCountry(countryType)
        }
        CountryViewController.modalPresentationStyle = .overCurrentContext
        CountryViewController.transitioningDelegate = self
        present(CountryViewController, animated: true)
        
    }
    

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title

        topView?.removeFromSuperview()
        switch menuType {
            case.business:
                fetchArticlesJSON(fromSource: "category=business")
                break
            case .entertainment:
                fetchArticlesJSON(fromSource: "category=entertainment")
                break
            case .general:
                fetchArticlesJSON(fromSource: "category=general")
                break
            case .health:
                fetchArticlesJSON(fromSource: "category=health")
                break
            case .science:
                fetchArticlesJSON(fromSource: "category=science")
                break
            case .sports:
                fetchArticlesJSON(fromSource: "category=sports")
                break
            case .technology:
                fetchArticlesJSON(fromSource: "category=technology")
                break
        }
    }
    func transitionToNewCountry(_ countryType: CountryType) {

        topView?.removeFromSuperview()
        switch countryType {
        
            case .ar:
                self.title = "Argentina"
                fetchArticlesJSON(fromSource: "Country=ar")
                break
            
            case .au:
                self.title = "Australia"
                fetchArticlesJSON(fromSource: "Country=au")
                break
            
            case .at:
                self.title = "Austria"
                fetchArticlesJSON(fromSource: "Country=at")
                break
            
            case .be:
                self.title = "Belgium"
                fetchArticlesJSON(fromSource: "Country=be")
                break
            
            case .br:
                self.title = "Brazil"
                fetchArticlesJSON(fromSource: "Country=br")
                break
            
            case .bg:
                self.title = "Bulgaria"
                fetchArticlesJSON(fromSource: "Country=bg")
                break
            
            case .ca:
                self.title = "Canada"
                fetchArticlesJSON(fromSource: "Country=ca")
                break
            
            case .cn:
                self.title = "China"
                fetchArticlesJSON(fromSource: "Country=cn")
                break
            
            case .co:
                self.title = "Colombia"
                fetchArticlesJSON(fromSource: "Country=co")
                break
            
            case .cu:
                self.title = "Cuba"
                fetchArticlesJSON(fromSource: "Country=cu")
                break
            
            case .cz:
                self.title = "Czech Republic"
                fetchArticlesJSON(fromSource: "Country=cz")
                break
            
            case .eg:
                self.title = "Egypt"
                fetchArticlesJSON(fromSource: "Country=eg")
                break
            
            case .fr:
                self.title = "France"
                fetchArticlesJSON(fromSource: "Country=fr")
                break
            
            case .de:
                self.title = "Germany"
                fetchArticlesJSON(fromSource: "Country=de")
                break
            
            case .gr:
                self.title = "Greece"
                fetchArticlesJSON(fromSource: "Country=gr")
                break
            
            case .hk:
                self.title = "Hong Kong"
                fetchArticlesJSON(fromSource: "Country=hk")
                break
            
            case .hu:
                self.title = "Hungary"
                fetchArticlesJSON(fromSource: "Country=hu")
                break
            
            case .ind:
                self.title = "India"
                fetchArticlesJSON(fromSource: "Country=in")
                break
            
            case .id:
                self.title = "Indonesia"
                fetchArticlesJSON(fromSource: "Country=id")
                break
            
            case .ie:
                self.title = "Ireland"
                fetchArticlesJSON(fromSource: "Country=ie")
                break
            
            case .il:
                self.title = "Israel"
                fetchArticlesJSON(fromSource: "Country=il")
                break
            
            case .it:
                self.title = "Italy"
                fetchArticlesJSON(fromSource: "Country=it")
                break
            
            case .jp:
                self.title = "Japan"
                fetchArticlesJSON(fromSource: "Country=jp")
                break
            
            case .lv:
                self.title = "Latvia"
                fetchArticlesJSON(fromSource: "Country=lv")
                break
            
            case .lt:
                self.title = "Lithuania"
                fetchArticlesJSON(fromSource: "Country=lt")
                break
            
            case .my:
                self.title = "Malaysia"
                fetchArticlesJSON(fromSource: "Country=my")
                break
            
            case .mx:
                self.title = "Mexico"
                fetchArticlesJSON(fromSource: "Country=mx")
                break
            
            case .ma:
                self.title = "Morocco"
                fetchArticlesJSON(fromSource: "Country=ma")
                break
            
            case .nl:
                self.title = "Netherlands"
                fetchArticlesJSON(fromSource: "Country=nl")
                break
            
            case .nz:
                self.title = "New Zealand"
                fetchArticlesJSON(fromSource: "Country=nz")
                break
            
            case .ng:
                self.title = "Nigeria"
                fetchArticlesJSON(fromSource: "Country=ng")
                break
            
            case .no:
                self.title = "Norway"
                fetchArticlesJSON(fromSource: "Country=no")
                break
            
            case .ph:
                self.title = "Philippines"
                fetchArticlesJSON(fromSource: "Country=ph")
                break
            
            case .pl:
                self.title = "Poland"
                fetchArticlesJSON(fromSource: "Country=pl")
                break
            
            case .pt:
                self.title = "Portugal"
                fetchArticlesJSON(fromSource: "Country=pt")
                break
            
            case .ro:
                self.title = "Romania"
                fetchArticlesJSON(fromSource: "Country=ro")
                break
            
            case .ru:
                self.title = "Russia"
                fetchArticlesJSON(fromSource: "Country=ru")
                break
            
            case .sa:
                self.title = "Saudi Arabia"
                fetchArticlesJSON(fromSource: "Country=sa")
                break
            
            case .rs:
                self.title = "Serbia"
                fetchArticlesJSON(fromSource: "Country=rs")
                break
            
            case .sg:
                self.title = "Singapore"
                fetchArticlesJSON(fromSource: "Country=sg")
                break
            
            case .sk:
                self.title = "Slovakia"
                fetchArticlesJSON(fromSource: "Country=sk")
                break
            
            case .si:
                self.title = "Slovenia"
                fetchArticlesJSON(fromSource: "Country=si")
                break
            
            case .za:
                self.title = "South Africa"
                fetchArticlesJSON(fromSource: "Country=za")
                break
            
            case .kr:
                self.title = "South Korea"
                fetchArticlesJSON(fromSource: "Country=kr")
                break
            
            case .se:
                self.title = "Sweden"
                fetchArticlesJSON(fromSource: "Country=se")
                break
            
            case .ch:
                self.title = "Switzerland"
                fetchArticlesJSON(fromSource: "Country=ch")
                break
            
            case .tw:
                self.title = "Taiwan"
                fetchArticlesJSON(fromSource: "Country=tw")
                break
            
            case .th:
                self.title = "Thailand"
                fetchArticlesJSON(fromSource: "Country=th")
                break
            
            case .tr:
                self.title = "Turkey"
                fetchArticlesJSON(fromSource: "Country=tr")
                break
            
            case .ae:
                self.title = "UAE"
                fetchArticlesJSON(fromSource: "Country=ae")
                break
            
            case .ua:
                self.title = "Ukraine"
                fetchArticlesJSON(fromSource: "Country=ua")
                break
            
            case .gb:
                self.title = "United Kingdom"
                fetchArticlesJSON(fromSource: "Country=gb")
                break
            
            case .us:
                self.title = "United States"
                fetchArticlesJSON(fromSource: "country=us")
                break
 
            case .ve:
                self.title = "Venuzuela"
                fetchArticlesJSON(fromSource: "Country=ve")
                break
        }
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
        func fetchArticlesJSON(fromSource provider: String){
            let jsonUrl = "https://newsapi.org/v2/top-headlines?\(provider)&apiKey=bb1270b8046e4a26b6dbdc87b4527e6e"
            guard let url = URL(string: jsonUrl) else{
                return
            }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil, response != nil else{
                    print("Something is wrong!")
                    return
                }

                do{
                    let article = try JSONDecoder().decode(Articles.self, from: data)
                    self.ArticleArray = article.articles
                    print("Downloaded!")
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                }
                }catch let error{
                    print(error)
                }
            }.resume()
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ArticleArray.count
        
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleView.text = ArticleArray[indexPath.row].title
            
            
            cell.descriptionView.text = ArticleArray[indexPath.row].description
            cell.authorView.text = ArticleArray[indexPath.row].author ?? "UnKnown"
            cell.dateView.text = ArticleArray[indexPath.row].publishedAt
            print(indexPath.row)
            
            if ArticleArray[indexPath.row].urlToImage != nil{
                if let imageURL = URL(string: ArticleArray[indexPath.row].urlToImage!){
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                cell.imgView.image = image
                            }
                        }
                    }
                }
                
            }else{
                print("Doesn't contain a imageURL!")
            }
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "detailsView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendData = segue.destination as! DetailsViewController
        sendData.detailsImage = ArticleArray[myIndex!].urlToImage ?? ""
        sendData.detailsTitle = ArticleArray[myIndex!].title ?? ""
        sendData.detailsTime = ArticleArray[myIndex!].publishedAt ?? ""
        sendData.detailsPublisher = ArticleArray[myIndex!].author ?? ""
        sendData.detailsContent = ArticleArray[myIndex!].content ?? ""
        sendData.weburl = ArticleArray[myIndex!].url ?? ""
        
    }
}
