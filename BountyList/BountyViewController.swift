//
//  BountyViewController.swift
//  BountyList
//
//  Created by Eddie Ahn on 01/07/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 4400000, 30000000, 1600000, 8000000, 7700000, 120000000]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
            
        }
    }
    //몇개를 보여줄까요? 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //8 말고 nameList.count를 입력해야 함.
        return nameList.count
    }
    //셀은 어떻게 표현할꺼야?
    // 커스터마이징 한 List Cell 쓸거임.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
                    return UITableViewCell()
                }
            //img, name, bounty 넣어야 함.
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
                        return cell
            
        }
    //셀이 클릭되었을때 어쩔꺼야?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: indexPath.row)
    }
    
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

}


