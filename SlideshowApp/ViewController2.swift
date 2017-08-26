//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by meg on 2017/08/19.
//  Copyright © 2017年 megusta. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    
    @IBOutlet weak var imageview2: UIImageView!
    
    var imageNames = ["p１.JPG", "p２.JPG", "p３.JPG", "p４.JPG", "p５.JPG"]
    var imageIndex = 0
    var image: UIImage!


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageview2.image = UIImage(named: imageNames[imageIndex])
        imageNames = ["p１.JPG", "p２.JPG", "p３.JPG", "p４.JPG", "p５.JPG"]
        imageIndex = 0




    

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
