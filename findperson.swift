//
//  findperson.swift
//  learn06
//
//  Created by 20141105063T on 16/7/11.
//  Copyright © 2016年 20141105063T. All rights reserved.
//

import Foundation
import UIKit
class Delet: UIViewController {
    
    @IBOutlet weak var todelet: UITextField!
    var db:SQLiteDB!
    
    
    @IBOutlet weak var a: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //initUser()
    }
    
    @IBAction func delet(sender: AnyObject) {
        delt()
    }
   
    @IBAction func deletphone(sender: AnyObject) {
        deletbyphone()
    }
   
    func delt(){
        let x=todelet.text!
        let sql = "delete from t_user where uname='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func deletbyphone(){
        let y=todelet.text!
        let sql = "delete from t_user where mobile='\(y)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
