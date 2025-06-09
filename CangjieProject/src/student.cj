package CangjieProject
import encoding.json.stream.*
import std.io.ByteArrayStream

public class Student<: JsonSerializable{
    public var id:String = ""
    public var name:String = ""
    
    public var grade:String = ""
    public var gender:String = ""
    
    

    public func constructor(id:String ,name:String,grade :String,gender:String){
        this.id = id
        this.name = name
       
        this.grade = grade
        this.gender = gender
    }
    public func toString(): String {
        return "Student(id=$id, name=$name, score=$score)"
    }
   
    public func getName():String{
        return name
    }
    public func getId():String {
        return id
    }
    public func getGrade():String{
        return grade
    }
    public func getGender():String{
        return gender
    }
    public func setGrade(grade:String){
        this.grade = grade
    }
    public func setGender(gender:String){
        this.gender = gender
    }
  
    public func setName(name:String){
        this.name = name
    }
    public func setId(id:String ){
        this.id = id
    }
    public func getInfo():String{
        return "学号："+id+" 姓名："+name+" 成绩："+" 性别："+gender+" 年级："+grade
    }
    public func toJson(writer: JsonWriter) {
        writer.startObject()  // 开始 JSON 对象
        
        // 写入基本信息
        writer.writeName("id").writeValue(id)
        writer.writeName("name").writeValue(name)
        writer.writeName("grade").writeValue(grade)
        writer.writeName("gender").writeValue(gender)
        
        writer.endObject()  // 结束 Student 对象
    }
    


}