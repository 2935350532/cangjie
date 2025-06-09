package CangjieProject
import std.fs.*
import encoding.json.*
import encoding.json.stream.*
import std.io.*

public class Storage { 
  

  
  public static  func createStudentInfo(path:String ) :Unit{

        let filePath: Path = Path("./path")  
        if (File.exists(filePath)) {
            File.delete(filePath)
        }
        var file: File = File(filePath, OpenOption.Create(false))
        if (File.exists(filePath)) {
            println("The file 'studentinfo.json' is created successfully.\n")
        }

    }
    

   public  func writeStudentInfo(student :Student) :Unit{

        
        try {
        let filePath: Path = Path("./studentinfo.jsonl")  
        var file = File(filePath, OpenOption.Append)
        let fileInfo = FileInfo(filePath)  
        var  writer = JsonWriter(file)
         let fmtCfg = WriteConfig.pretty
         writer.writeConfig = fmtCfg
           
        writer.writeValue(student)
        writer.flush()  
        file.close()

        println("学生数据已写入")

        } catch (e: Exception) {
             println("写入失败")
        }
    }


    public  func readStudentInfo() :String{

        let filePath: Path = Path("./studentinfo.jsonl")  
        var file = File(filePath, OpenOption.Open(true,false))
        try {

        let contentBytes = file.readToEnd()
        return String.fromUtf8(contentBytes)
        
       
        
        } catch (e: Exception) {
            println("读取失败: (e.message)")
            return ""
            
        } finally{
            file.close()
        }

    }



}