//
//  ViewController.swift
//  MVVMApiNews
//
//  Created by Oğuzhan Erdem on 3.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let New = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  NewsTableViewCell
    return cell
}

    
   
}
