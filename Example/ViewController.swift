//
//  ViewController.swift
//  Example
//
//  Created by Alexander Schuch on 12/07/14.
//  Copyright (c) 2014 Alexander Schuch. All rights reserved.
//

import UIKit
import AwesomeCache

struct Person: Codable, CustomStringConvertible {
    let name: String
    let age: Int
    var description: String {
        return "name: \(name), age: \(age)"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    let cache = try! Cache<Person>(name: "AwesomeCache")
                            
	override func viewDidLoad() {
		super.viewDidLoad()
        cache["person"] = Person(name: "Cai", age: 18)
        print(cache.cacheDirectory)
	}
    
    @IBAction func reloadData(_ sender: AnyObject?) {
        print(cache["person"])
        textView.text = cache["person"]?.description
    }
    
    @IBAction func saveInCache(_ sender: AnyObject?) {
        
        cache["person"] = Person(name: "Caiflower", age: 30)
    }
}

