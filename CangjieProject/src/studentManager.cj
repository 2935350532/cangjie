package CangjieProject
import std.console.*
import std.format.*
import std.random.Random
import std.collection.*
import std.convert.*
import encoding.json.stream.*
import std.fs.*
import std.io.*

public class studentManager {
   
    var studentList = ArrayList<Student>()
    let validator = validate()


    public func add(student: Student): Unit {
             var id:String = ""
             var name:String = ""
             var grade:String = ""
             var gender:String = ""


        println("\t-----------------------")
        println("\t  新增学生信息")
        println("\t-----------------------")
        
        while(true){
            print("\t  请输入学号: ")
            id = Console.stdIn.readln().getOrThrow()
            if(validator.validateId(id)==false){
            print("\t  学号不正确，请重新输入学号: ")
            }
            else{
                break
            }
        }
        
        while(true){ 
            print("\t  请输入姓名: ")
            name = Console.stdIn.readln().getOrThrow()
            if(validator.validateName(name)==false){
            print("\t  姓名不正确，请重新输入姓名: ")
            }
            else{
                break
            }
        }
        
        while(true){
            print("\t  请输入年级: ")
            let grade= Console.stdIn.readln().getOrThrow()
            if(validator.validateGrade(grade)==false){
            print("\t  年级不正确，请重新输入年级: ")
          }
          else{
                break
            }
        }
        
        while (true){
            print("\t  请输入性别: ")
            gender =Console.stdIn.readln().getOrThrow()
            if(validator.validateGender(gender)==false){
            print("\t  性别不正确，请重新输入性别: ")
            }
            else{
                break
            }
        }
        let newstudent = Student()
        newstudent.constructor(id, name,grade, gender)
        let storage = Storage()
        storage.writeStudentInfo(newstudent)
        println("\t  新增学生信息成功")
        println("\t-----------------------")
     }
    
     public func getAllStudents(): Unit  {
        let storage = Storage()
         print(storage.readStudentInfo())
     }


    public func getStudentById(): Unit {
             var id:String = ""
             var name:String = ""
             var grade:String = ""
             var gender:String = ""
        while(true){
            print("\t  请输入学号: ")
            id = Console.stdIn.readln().getOrThrow()
            if(validator.validateId(id)==false){
            print("\t  输入学号格式不正确，请重新输入学号: ")
            }
            else{
                break
            }
        }
        let filePath: Path = Path("./studentinfo.jsonl")
        var file = File(filePath, OpenOption.Open(true, false))


    try {
        let reader = JsonReader(file)

        while (true) {
            match (reader.peek()) {
                case None => 
                    println("未找到该学生")
                    break

                case Some(BeginObject) => 
                    reader.startObject()

                    var currentId: String = ""
                    var name: String = ""
                    var grade: String = ""
                    var gender: String = ""

                    while (reader.peek() != EndObject) {
                        let key = reader.readName()

                        match (key) {
                            case "id" => currentId = reader.readValue<String>()
                            case "name" => name = reader.readValue<String>()
                            case "grade" => grade = reader.readValue<String>()
                            case "gender" => gender = reader.readValue<String>()
                            case _ => reader.skip()
                        }
                    }

                    reader.endObject()

                    if (currentId == id) {
                        println("\t-----------------------")
                        println("\t  找到学生信息：")
                        println("\t  学号: "+ currentId)
                        println("\t  姓名: "+ name)
                        println("\t  年级: "+grade)
                        println("\t  性别: "+gender)
                        println("\t-----------------------")
                        return
                    }
                    
                    
                case Some(_) => 
                reader.skip()
              }
           }
       } catch (e: Exception) {
                println("查询失败: $e.message")
            } finally {
                file.close()
            }
    }
    

    public func getStudentByName(): Unit {
        var name:String = ""

        while(true){
            print("\t  请输入姓名: ")
            name = Console.stdIn.readln().getOrThrow()
            if(validator.validateName(name)==false){
            print("\t  输入姓名格式不正确，请重新输入姓名: ")
            }
            else{
                break
            }
        }
        
            let filePath: Path = Path("./studentinfo.jsonl")
            var file = File(filePath, OpenOption.Open(true, false))

            try {
                let reader = JsonReader(file)

                while (true) {
                    match (reader.peek()) {
                        case None => 
                            println("\t-----------------------")
                            println("\t  未找到对应姓名的学生")
                            println("\t-----------------------")
                            return
                        

                        case Some(BeginObject) => 
                            reader.startObject()

                            var currentId: String = ""
                            var name: String = ""
                            var grade: String = ""
                            var gender: String = ""

                            while (reader.peek() != EndObject) {
                                let key = reader.readName()

                                match (key) {
                                    case "id" => currentId = reader.readValue<String>()
                                    case "name" => name = reader.readValue<String>()
                                    case "grade" => grade = reader.readValue<String>()
                                    case "gender" => gender = reader.readValue<String>()
                                    case _ => reader.skip()
                                }
                            }

                            reader.endObject()

                            if (name == name) {
                                println("\t-----------------------")
                                println("\t  找到学生信息：")
                                println("\t  学号: "+currentId)
                                println("\t  姓名: "+name)
                                println("\t  年级: "+grade)
                                println("\t  性别: "+gender)
                                println("\t-----------------------")
                                return
                            }
                        

                        case Some(_) => 
                            reader.skip()
                        
                    }
                }

            } catch (e: Exception) {
                println("查询失败: $e.message")
            } finally {
                file.close()
            }
}
    


    public func UpdateStudent() { 
        let filePath: Path = Path("./studentinfo.jsonl")
        let tempFilePath = Path("./temp_studentinfo.jsonl")
        var file = File(filePath, OpenOption.Open(true, false))
        var tempFile = File(tempFilePath, OpenOption.Create(false))
        let validator = validate()
        var flag = 0
        var id:String = ""
        var name:String = ""
        var newGrade:String = ""
        var gender:String = ""
        while(true){
            print("\t  请输入学号: ")
            id = Console.stdIn.readln().getOrThrow()
            if(validator.validateId(id)==false){
            print("\t  学号不正确，请重新输入学号: ")
            }
            else{
                break
            }
        }
        
        while(true){
            print("\t  请输入修改后的年级: ")
            newGrade= Console.stdIn.readln().getOrThrow()
            if(validator.validateGrade(newGrade)==false){
            print("\t  输入年级格式不正确，请重新输入年级: ")
          }
          else{
                break
            }
        }
        
        try {
            let reader = JsonReader(file)
            tempFile = File(tempFilePath, Append)

            while (true) {
                let writer = JsonWriter(tempFile)
                // 设置 JSON 写格式配置
                let fmtCfg = WriteConfig.pretty
                writer.writeConfig = fmtCfg

                match (reader.peek()) {
                    case None => break

                    case Some(BeginObject) => 
                        //println("Reading object")
                        reader.startObject()
                        var currentId: String = ""
                        var name: String = ""
                        var grade: String = ""
                        var gender: String = ""

                        while (reader.peek() != EndObject) {
                            let key = reader.readName()

                            match (key) {
                                case "id" => currentId = reader.readValue<String>()
                                case "name" => name = reader.readValue<String>()
                                case "grade" => grade = reader.readValue<String>()
                                case "gender" => gender = reader.readValue<String>()
                                case _ => reader.skip()
                            }
                        }

                        reader.endObject()

                        // 如果匹配到要修改的学生，则更新其字段
                        if (currentId == id) {
                            grade = newGrade
                            flag=1
                        }
                       

                        
                        // 写入到临时文件
                        writer.startObject()
                        writer.writeName("id").writeValue(currentId)
                        writer.writeName("name").writeValue(name)
                        writer.writeName("grade").writeValue(grade) 
                        writer.writeName("gender").writeValue(gender)
                        writer.endObject()

                 case Some(_) => reader.skip()   

                        
                }
                
                writer.flush()
               
            }
            if(flag==0){
                println("未找到该学生")
                return
            }else{
                println("更新成功") 
            }
               
            
        } catch (e: Exception) {
            println("更新失败: $e.message")
        } finally {
            file.close()
            tempFile.close()
        }

        // 替换原文件为更新后的临时文件
       File.copy(tempFilePath, filePath,true)
       File.delete(tempFilePath)
    }
        
    public func deleteStudentById(): Unit {
        var flag = 0
        var id:String = ""
        while(true){
            print("\t  请输入学号: ")
            id = Console.stdIn.readln().getOrThrow()
            if(validate().validateId(id)==false){
            print("\t  学号不正确，请重新输入学号: ")
            }
            else{
                break
            }
        }

            let filePath: Path = Path("./studentinfo.jsonl")
            let tempFilePath = Path("./temp_studentinfo.jsonl")
            var file = File(filePath, OpenOption.Open(true, false))
            var tempFile = File(tempFilePath, OpenOption.Create(false))
            
            try {
                let reader = JsonReader(file)
                tempFile = File(tempFilePath, Append)

                while (true) {
                    match (reader.peek()) {
                        case None => break

                        case Some(BeginObject) => 
                            reader.startObject()
                            var currentId: String = ""
                            var name: String = ""
                            var grade: String = ""
                            var gender: String = ""

                            while (reader.peek() != EndObject) {
                                let key = reader.readName()

                                match (key) {
                                    case "id" => currentId = reader.readValue<String>()
                                    case "name" => name = reader.readValue<String>()
                                    case "grade" => grade = reader.readValue<String>()
                                    case "gender" => gender = reader.readValue<String>()
                                    case _ => reader.skip()
                                }
                            }

                            reader.endObject()

                            // 如果当前学生的 ID 不匹配，则写入临时文件
                            if (currentId != id) {
                                let writer = JsonWriter(tempFile)
                                let fmtCfg = WriteConfig.pretty
                                writer.writeConfig = fmtCfg
                                writer.startObject()
                                writer.writeName("id").writeValue(currentId)
                                writer.writeName("name").writeValue(name)
                                writer.writeName("grade").writeValue(grade)
                                writer.writeName("gender").writeValue(gender)
                                writer.endObject()
                                writer.flush()
                            } else {
                                println("\t-----------------------")
                                println("\t  学号为"  + currentId + "的学生已被删除")
                                println("\t-----------------------")
                            }
                        
                        case Some(_) => reader.skip()
                    }
                }
            } catch (e: Exception) {
                println("删除失败: $e.message")
            } finally {
                file.close()
                tempFile.close()
            }

            // 替换原文件为更新后的临时文件
            
            File.copy(tempFilePath, filePath,true)
            File.delete(tempFilePath)
        }

}