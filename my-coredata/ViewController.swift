//
//  ViewController.swift
//  my-coredata
//
//  Created by Kochi Lin on 12/16/16.
//  Copyright © 2016 Kochi Lin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //store data
    let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
    let context  =  (appDelegate).managedObjectContext
    
    let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
    
    newUser.setValue("Yes", forKey: "username")
    newUser.setValue("Bro", forKey: "password")
    /*
     * trying to  save image
     
     let imgPNG = UIImage(named:"my-test.png")
     let imgdata  = UIImagePNGRepresentation(imgPNG!)
     //avata must be "binary data" attribute
     newUser.setValue(imgdata, forKey: "avata")
     */
    
    
    do{
      
      try! context.save()
      print("data saved")
    }catch let error as NSError {
      print(" error during saving data")
      print(error)
    }
    
    //query data
    
    let request = NSFetchRequest()
    let entity =  NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
    
    request.entity = entity
    request.fetchBatchSize = 20
    
    do{
      let result  = try! context.executeFetchRequest(request)
      
      if(result.count > 0 ){
        let user  = result[2] as! Users
        print("================user name:\(user.username)")
        print("================user password:\(user.password)")
      }else{
        print("no record found")
      }
    }
    
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

