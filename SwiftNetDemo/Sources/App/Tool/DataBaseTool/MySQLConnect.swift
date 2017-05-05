//
//  MySQLConnect.swift
//  Hello
//
//  Created by Andy on 2017/4/21.
//
//

import MySQL

class MySQLConnect {
    
    var host: String{
        get{
            return "127.0.0.1"
        }
    }
    
    var port: UInt32{
        get{
            return 3306
        }
    }
    
    var user: String{
        get{
            return "root"
        }
    }
    
    var passworld: String{
        get{
            return "123456"
        }
    }
    
    private var mysql: MySQL!
    
    private static var instance: MySQLConnect!
    public static func ay_shareInstance(dataBaseName: String)->MySQLConnect{
        
        if instance == nil {
            instance = MySQLConnect.init(dataBaseName: dataBaseName)
        }
        
        return instance;
        
    }
    
    
    
    private init(dataBaseName: String){
        if mysql == nil {
            mysql = MySQL()
        }
        
        if mysql.connect(host: host, user: user, password: passworld, db: dataBaseName, port: port) {
            print("链接成功！")
        }else{
            print(" \(mysql.errorCode())---------\(mysql.errorMessage())")
            
        }
    }
    
    
    public func insertStudebt(name: String, age: Int, sex: Bool){
        if mysql.query(statement: "insert into student_tb (name , age , sex) values ('\(name)',\(age),\(sex))") {
            print("insert success")
        }else {
            print(" \(mysql.errorCode())---------\(mysql.errorMessage())")
        }
    }
    
    
    public func select(){
        if mysql.query(statement: "select * from student_tb") {
            let result = mysql.storeResults()!
            result.forEachRow(callback: { (row) in
                print("\(row[0]!)-----\(row[1]!)-----\(row[2]!)-----\(row[3]!)")
            })
        }
    }
    
    
    
    
    
    

}
