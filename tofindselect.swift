//
//  tofindselect.swift
//  learn06
//
//  Created by 20141105063T on 16/7/11.
//  Copyright © 2016年 20141105063T. All rights reserved.
//

import Foundation
import UIKit
class tofindselect: UIViewController {
    
    @IBOutlet weak var cccc: UITextField!
    var db:SQLiteDB!
    
    @IBOutlet weak var sss: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    
   
    @IBAction func findname(sender: AnyObject) {
        find()
    }
    
    @IBAction func phone(sender: AnyObject) {
        deletbyphone()
    }
    
    func find(){
        sss.text=""
        let x=cccc.text!
        let data = db.query("select * from t_user where uname='\(x)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
            sss.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
        
    }
    func deletbyphone(){
        sss.text=""
        let y=cccc.text!
        let data = db.query("select * from t_user where mobile='\(y)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
            sss.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
