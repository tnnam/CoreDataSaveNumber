//
//  ViewController.swift
//  CoreDataSaveNumber
//
//  Created by Tran Ngoc Nam on 5/7/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit
import CoreData

class NumberViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            guard let entity = try AppDelegate.context.fetch(Number.fetchRequest()) as? [Number] else { return }
            numberTextField.text = "\(entity.first?.num ?? 0)"
        } catch {
            print("Fetch Error")
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNumber(_ sender: UIBarButtonItem) {
        let entity = Number(context: AppDelegate.context)
        guard let num = Int(numberTextField.text ?? "") else { return }
        entity.num = Int64(num)
        AppDelegate.saveContext()
    }
    
}


