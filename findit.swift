//
//  findit.swift
//  learn06
//
//  Created by 20141105063T on 16/7/11.
//  Copyright © 2016年 20141105063T. All rights reserved.
//

import Foundation
import UIKit
class findit: UIViewController {
    
    var db:SQLiteDB!

    @IBOutlet weak var rr: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    @IBAction func see(sender: AnyObject) {
        selete()
    }
    
    
    func selete(){
        rr.text = ""
        let data = db.query("select * from t_user")
        for var x=0;x<data.count;x++ {
            let tuser = data[x]
            rr.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
