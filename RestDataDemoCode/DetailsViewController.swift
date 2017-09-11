//
//  DetailsViewController.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 RJTCOMPUQUEST. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!

    @IBOutlet weak var labelSpouse: UILabel!
    @IBOutlet weak var labelChildren: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelDob: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    var image:UIImage?
    
    @IBOutlet weak var imageViewActor: UIImageView!
    var imageUrl:String?
    var actorName:String!
    var actorArray: Array<Actor> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(actorName)
        
        getApiCallForActors()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func getApiCallForActors() {
        
        WebServiceHandler.sharedInstance.getActorArray { (actorArra) in
            if let arr = actorArra as? [Actor]{
               self.actorArray = arr
                
                for actor in self.actorArray {
                    print(actor.name!)
                    if actor.name == self.actorName{
                        self.labelName.text = actor.name
                        self.labelDob.text = "born on \n \(actor.dob!)"
                        self.labelHeight.text = actor.height
                        self.labelSpouse.text = actor.spouse
                        self.labelChildren.text = actor.children
                        self.labelCountry.text = actor.country
                        self.imageUrl = actor.imageUrl
                        let imageUrlFromString = URL(string: self.imageUrl!)
                        let imagedata = try? Data(contentsOf: imageUrlFromString!)
                        self.image = UIImage(data: imagedata!)
                        self.imageViewActor.image = self.image
                    }
                }
                
               /* DispatchQueue.main.sync {
                   // self.tblview.reloadData()
                   // self.refresh.endRefreshing()
                    self.actorArray = arr
                }*/
            }
            
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
