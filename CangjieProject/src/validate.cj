package CangjieProject
import std.console.*
import std.format.*
import std.regex.*
import std.format.*
public class validate
{
     private let idPattern = Regex("^\\d{6}$")
    
    // 姓名：英文，姓和名首字母大写，中间用空格分隔（可选）
    private let namePattern = Regex("^[A-Z][a-z]+(\\s[A-Z][a-z]+)?$")
    
    
    
    // 年级：grade one 到 grade four（不区分大小写）
    private let gradePattern = Regex("^grade\\s+(one|two|three|four)$")  
    
    // 性别：male 或 female（不区分大小写）
    private let genderPattern = Regex("^(male|female)$")  // "i" 表示忽略大小写




    public func validateId(id: String) : Bool {
    match(idPattern.matches(id) ){
        case Some(r) => return true
        case None => return false
         
    //    return idPattern.matches(id) 
    }
    }
    // 验证姓名
    public func validateName(name: String) : Bool {
        match(namePattern.matches(name) ){
            case Some(r) => return true
            case None => return false
        }
    }
    
   
    
    // 验证年级
    public func validateGrade(grade: String) : Bool {
        match(gradePattern.matches(grade) ){
            case Some(r) => return true
            case None => return false
        }
    }
    
    // 验证性别
    public func validateGender(gender: String) : Bool {
       match(genderPattern.matches(gender) ){
            case Some(r) => return true
            case None => return false
        }
    }
    

    
}