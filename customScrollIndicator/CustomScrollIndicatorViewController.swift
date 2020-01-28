//
//  customScrollIndicatorViewController.swift
//  customScrollIndicator
//
//  Created by Yasin Ilker Mehder (Dogus Teknoloji) on 27.01.2020.
//  Copyright © 2020 Yasin Ilker Mehder (Dogus Teknoloji). All rights reserved.
//

import UIKit


class CustomScrollIndicatorViewController: UIViewController {

    var x = 1
    
    @IBOutlet weak var scrollIndicator: ScrollIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        	
    }
    
    @IBAction func scrollAction(_ sender: Any) {
        
        scrollIndicator.scrollForItem(index: x)
        x += 1
    
    }
    
    
    
    

}
