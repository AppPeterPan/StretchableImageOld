//
//  SongTableViewController.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/8/17.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    let imageOriginalHeight: CGFloat = 450

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsets(top: imageOriginalHeight, left: 0, bottom: 0, right: 0)
        
    }

    // MARK: - Table view data source

   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let controller = parent as? ImageViewController
        let originalOffsetY = -imageOriginalHeight
        let moveDistance = abs(scrollView.contentOffset.y - originalOffsetY)

        if scrollView.contentOffset.y < originalOffsetY  {
            controller?.imageViewHeightConstraint.constant = imageOriginalHeight + moveDistance
            controller?.imageView.alpha = 1
            //tableView.backgroundColor = UIColor.clear
        } else {
            controller?.imageViewHeightConstraint.constant = imageOriginalHeight
            tableView.backgroundColor = UIColor(white: 0, alpha: moveDistance / imageOriginalHeight)
            controller?.imageView.alpha = (imageOriginalHeight - moveDistance) / imageOriginalHeight

        }
    }
    
}

