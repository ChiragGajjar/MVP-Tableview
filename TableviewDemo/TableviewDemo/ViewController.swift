//
//  ViewController.swift
//  TableviewDemo
//
//  Created by apple on 2018-02-22.
//  Copyright © 2018 Doth Solutions. All rights reserved.
//

import UIKit
import SVProgressHUD


class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    private let dataSource = DRHTableViewDataModel()
   
    
    fileprivate var dataArray = [DataList]() {
        didSet {
            tblView?.reloadData()
            tblView.setNeedsDisplay()
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        dataSource.delegate = self
        dataSource.RequestData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate{
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath)as! DemoCell
        
        let Data = dataArray[indexPath.item]
        
        cell.lblName.text = Data.strName
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next = storyboard?.instantiateViewController(withIdentifier: "DetailsVC")as! DetailsVC
        next.data = dataArray[indexPath.item]
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}
extension ViewController:DRHTableviewDataModelDelegate{
    func didRecieveDataUpdate(data: [DataList]) {
        dataArray = data
    }
    
    func didFailDataUpdateWithError(error: Error) {
        
    }
    
    func startLoading() {
        print("start")
        SVProgressHUD.show()
    }
    func stopLoading() {
        print("stop")
        SVProgressHUD.dismiss()
    }
}
