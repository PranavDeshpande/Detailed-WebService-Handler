//
//  SecondViewController.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 AM Esfar-E-Alam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblview: UITableView!
    var actorArray: Array<Actor> = []
    var refresh = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblview.tableFooterView = UIView()
        refresh.isEnabled = true
        refresh.tintColor = UIColor.black
        refresh.addTarget(self, action: #selector(ActorListViewController.refreshAction(_:)), for: .valueChanged)
        self.tblview.addSubview(refresh)
        tblview.rowHeight = UITableViewAutomaticDimension
        tblview.estimatedRowHeight = 104
        
        getApiCallForActors()
    }
    func refreshAction(_ sender:Any)  {
        actorArray.removeAll()
        getApiCallForActors()
        
        print("hello")
    }
    
    func getApiCallForActors() {
        
        WebServiceHandler.sharedInstance.getActorArray { (actorArra) in
            if let arr = actorArra as? [Actor]{
                self.actorArray = arr
                DispatchQueue.main.async {
                    self.tblview.reloadData()
                    self.refresh.endRefreshing()
                }
                
            }
            
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic", for: indexPath) as! TableViewCell
        let  actor = actorArray[indexPath.row]
        //cell.textLabel?.text = actor.name
        cell.labelName.text = actor.name
        cell.labelDescription.text = actor.descripton
        
        // Configure the cell...
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let txt = actorArray[indexPath.row].name
        
        print(txt)
        print("row num: \(indexPath.row)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //   let person = personArr[indexPath.row]
        if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            
            viewcontroller.actorName = txt
            self.navigationController?.pushViewController(viewcontroller, animated: true)
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
