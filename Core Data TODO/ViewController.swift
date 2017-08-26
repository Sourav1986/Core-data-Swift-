//
//  ViewController.swift
//  Core Data TODO
//
//  Created by Sourav Basu Roy on 31/05/17.
//  Copyright © 2017 Sourav Basu Roy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var txtEmpld: UITextField!
    @IBOutlet weak var txtEmpName: UITextField!
    @IBOutlet weak var txtEmpRole: UITextField!
    @IBOutlet weak var txtEmpAddress: UITextField!
    @IBOutlet weak var txtEmpSalary: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetch()
        } catch  {
            fatalError(error.localizedDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetch() throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return  }
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        let employees = try manageContext.fetch(fetchRequest) as! [Employee]
        for emp in employees {
            print("\(emp.name ?? "no data"),\(emp.address ?? "no data"),\(emp.salary ?? 0.0),\(emp.role ?? "no data")")
        }
        
    }
    
    func save() throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return  }
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Employee", in: manageContext)
        let newRecord = Employee(entity: entity!, insertInto: manageContext)
        
        newRecord.empid = txtEmpld.text ?? "no data"
        newRecord.name = txtEmpName.text ?? "no data"
        newRecord.role = txtEmpRole.text ?? "no data"
        newRecord.address = txtEmpAddress.text ?? "no data"
        newRecord.salary = (Float(txtEmpSalary.text ?? "0.0") as! NSDecimalNumber)
        
        try manageContext.save()
        try fetch()

    }
    
    @IBAction func AddRecord(_ sender: Any) {
        do {
            try save()
        } catch  {
            fatalError(error.localizedDescription)
        }
    }
    
}

