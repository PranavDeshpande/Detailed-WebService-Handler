//
//  ActorListViewController.swift
//  RestDataDemoCode
//
//  Created by AM Esfar-E-Alam on 7/6/17.
//  Copyright © 2017 AM Esfar-E-Alam. All rights reserved.
//

import UIKit

class ActorListViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tblview: UITableView!
    var actorArray: Array<[String:Any]> = []
    var refresh = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblview.tableFooterView = UIView()
        refresh.isEnabled = true
        refresh.tintColor = UIColor.black
        refresh.addTarget(self, action: #selector(ActorListViewController.refreshAction(_:)), for: .valueChanged)
        self.tblview.addSubview(refresh)
        getApiCallForActors()
    }
    func refreshAction(_ sender:Any)  {
        actorArray.removeAll()
        getApiCallForActors()
        refresh.endRefreshing()
        print("hello")
    }

    func getApiCallForActors() {
        
        let urlRequest = URL(string: urlString)
        
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            
            if error == nil{
                
                do{
                    if let jsonResult =  try JSONSerialization.jsonObject(with: data!, options:[]) as? Dictionary<String, Any>{
                        
                        let arr = jsonResult["actors"] as? [[String:Any]]
                        print(arr)
                        let results = jsonResult["name"] as? String
                        print("hey hi how are you")
                        print(results)
                        
                        self.actorArray = arr!
                        DispatchQueue.main.sync {
                            self.tblview.reloadData()
                        }
                    }
                }catch{
                    print(error)
                }
                
            }
            
        }.resume()
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic", for: indexPath)
         let  dict = actorArray[indexPath.row] as Dictionary
         cell.textLabel?.text = dict["name"] as! String?
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
