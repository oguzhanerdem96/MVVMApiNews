//
//  ViewController.swift
//  MVVMApiNews
//
//  Created by Oğuzhan Erdem on 3.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        veriAl()
    }
    func veriAl(){
        let url = URL(string:
         "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebService().haberleriIndır(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            }
        }
    }

}
extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowInSection()
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  NewsTableViewCell
    let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
    cell.titleLbl.text = newsViewModel.title
    cell.descriptionLbl.text = newsViewModel.story
    return cell
}

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
}
