//
//  ModelClass.swift
//  TableviewDemo
//
//  Created by apple on 2018-02-22.
//  Copyright © 2018 Doth Solutions. All rights reserved.
//

import Foundation

class DataList{
    
    var strName:String?
    
    init?(data:NSDictionary) {
      
        print(data )
        let Name:String = data.value(forKey: "name") as! String
        self.strName = Name
    }
}
