package CangjieProject
import std.console.*
import std.format.*
import std.fs.*
import encoding.json.*
import encoding.json.stream.*
import std.io.ByteArrayStream
import std.database.sql.*


main(){
	


    println("进入学生信息管理系统")

    let student = Student()
    let stu = studentManager()
    let validator = validate()

    while(true){
        println("1.添加学生信息")
        println("2.查询所有学生信息")
        println("3.修改学生信息")
        println("4.查询学生信息")
        println("5.删除学生信息")
        println("6.退出系统")
        println("请输入您的选择：")
        let choice = Console.stdIn.readln().getOrThrow()
        match (choice) {
            case "1" => 
                println("添加学生信息")
                stu.add(student)
                
                break
            
            case "2" => 
                println("查询所有学生信息")
                stu.getAllStudents()
                break
            
            case "3" => 
                println("修改学生信息")
                println("\t-----------------------")
                stu.UpdateStudent()
                println("\t-----------------------")
                break
            
            case "4" => 
                println("\t查询学生信息")
                println("\t-----------------------")
                println("\t按学号查询请输入1\t按姓名查询请输入2")
                let choice = Console.stdIn.readln().getOrThrow()
                match (choice) {
                    case "1" => 
                        println("\t请输入要查询的学号：")
                        
                        stu.getStudentById()
                        break
                    case "2" => 
                        println("\t请输入要查询的姓名：")
                        stu.getStudentByName()
                    case _ => 
                        println("\t无效输入！,请重新输入！")
                       
                }
                println("\t-----------------------")
                break
            case "5" => 
                println("删除学生信息")
                println("\t-----------------------")
                stu.deleteStudentById()
                println("\t-----------------------")
                break
            case "6" => 
                println("退出系统")
                break
            
            case _ =>  
                println("无效输入，请重新输入！")
            
        }
    }

    
}

   






