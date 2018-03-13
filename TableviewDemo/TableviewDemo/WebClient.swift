//
//  WebClient.swift
//  TableviewDemo
//
//  Created by apple on 2018-02-22.
//  Copyright © 2018 Doth Solutions. All rights reserved.
//

import Foundation
import Alamofire


protocol DRHTableviewDataModelDelegate:class{
    func didRecieveDataUpdate(data: [DataList])
    func didFailDataUpdateWithError(error: Error)
    func startLoading()
    func stopLoading()
}

class DRHTableViewDataModel: NSObject {
    
    weak var delegate:DRHTableviewDataModelDelegate?
    
    func RequestData(){
        
        var data: [AnyObject]? = nil
        let error: Error? = nil
        delegate?.startLoading()
        
        Alamofire.request("https://api.hubapi.com/contacts/v1/lists/static?count=3&hapikey=demo", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
          

            let dic:NSDictionary = response.result.value as! NSDictionary
            data = dic.value(forKey: "lists") as? [AnyObject]
           
            if let error = error {
                self.delegate?.stopLoading()
                self.delegate?.didFailDataUpdateWithError(error: error)
                
            } else if let data = data {
                self.delegate?.stopLoading()
                self.setDataWithResponse(response: data)
            }
            
        }
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        var data = [DataList]()
        for item in response {
            let mdic:NSDictionary = item as! NSDictionary
            
            print(mdic)
            if let drhTableViewDataModelItem = DataList(data:mdic) {
                data.append(drhTableViewDataModelItem)
            }
        }
        delegate?.didRecieveDataUpdate(data: data)
    }
    
}
