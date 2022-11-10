import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper{
  Database?db;

  Future<Database> checkDatabase()async{
    if(db!=null)
    {
      return db!;
    }
    else
    {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase()async{
    Directory  folder = await getApplicationDocumentsDirectory();
    String  path =  join(folder.path,"rnw.db");
    return  openDatabase(path,version:1,onCreate:(db,version){
      String query = "CREATE TABLE cilent(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,mobile TEXT,address TEXT)";
      db.execute(query);
    });
  }

  void insertData(String n1,String a1 ,String m1)async{
    db =  await checkDatabase();
    db!.insert("cilent", {"name":n1,"address":a1,"mobile":m1,});
  }

  Future<List<Map>> readData()async{
    db= await checkDatabase();
    String query = "SELECT * FROM cilent";
    List<Map> CilentList = await db!.rawQuery(query,null);
    return CilentList;
  }

  void deletedata(String id)async{
    db= await checkDatabase();
    db!.delete("cilent",where: "id = ?",whereArgs: [int.parse(id)]);
  }

  void updatedata(String id,String n1, String m1,String a1)async{
    db= await checkDatabase();
    db!.update("cilent", {"name":n1,"mobile":m1,"address":a1},where:"id = ?",whereArgs: [int.parse(id)]);
  }

}