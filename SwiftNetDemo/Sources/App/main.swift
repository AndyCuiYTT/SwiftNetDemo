import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.get("hello"){request in
    
    
    let myconnect: MySQLConnect = MySQLConnect.ay_shareInstance(dataBaseName: "student_db")
    
    myconnect.insertStudebt(name: "ager", age: 23, sex: true)
    myconnect.select()
    
    return "hello world"
    
}


drop.run()
