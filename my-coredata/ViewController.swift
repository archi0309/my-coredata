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
  @IBOutlet weak var img_avatar: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //store data
    let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
    let context  =  (appDelegate).managedObjectContext
    
    let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context)
    
    newUser.setValue("USER3", forKey: "name")
    newUser.setValue(false, forKey: "gender")
    newUser.setValue(1980, forKey: "year")
    
    let imgPNG = UIImage(named:"my-test.png")
    let imgdata  = UIImagePNGRepresentation(imgPNG!)
    //avata must be "binary data" attribute
    newUser.setValue(imgdata, forKey: "avatar")
    
    
    do{
      try! context.save()
      print("data saved")
    }catch {
      let error = error as NSError
      print(" error during saving data")
      print(error)
    }
    
    //query data
    
    let request = NSFetchRequest()
    let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: context)
    
    request.entity = entity
    request.fetchBatchSize = 20
    
    let  sportDesc1 = NSSortDescriptor(key:"name",ascending: false)
    request.sortDescriptors = [sportDesc1]
    
    do{
      let results  = try! context.executeFetchRequest(request)
      
      for managedObject in results {
        if let name = managedObject.valueForKey("name"), year = managedObject.valueForKey("year"),avatar = managedObject.valueForKey("avatar") {
          print("\(name) \(year)")
          
          img_avatar.image = UIImage(data: avatar as! NSData)
          
        }
      }
      
    }
    
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

