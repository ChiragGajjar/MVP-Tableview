//
//  DetailsVC.swift
//  TableviewDemo
//
//  Created by apple on 2018-02-22.
//  Copyright © 2018 Doth Solutions. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    
    var data:DataList? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = data?.strName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
