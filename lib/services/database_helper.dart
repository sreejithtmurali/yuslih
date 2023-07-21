
import 'package:yuslih/ui/screens/home/workerrr.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBWorkerManager {
  late Database _datebase;

  Future openDB() async {
    _datebase = await openDatabase(join(await getDatabasesPath(), "yusli.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE worker(id String PRIMARY KEY,password TEXT,adharno TEXT,phone TEXT,dropdownValue TEXT,name TEXT,amt TEXT,selectedCategory TEXT,email TEXT,url TEXT)");

        });
  }



  Future<int> insertStudent(Worker worker) async {
    await openDB();
    return await _datebase.insert('worker', worker.toMap());

  }




  Future<List<Worker>> getStudentList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase.query('worker');
    return List.generate(maps.length, (index) {
      ////   required this.password,
      // //     required this.adharno,
      // //     required this.phone,
      // //     required this.dropdownValue,
      // //     required this.name,
      // //     required this.amt,
      // //     required this.selectedCategory,
      // //     required this.email,
      // //     required this.url,
      return Worker(id: maps[index]['id'],
        password:  maps[index]['password'],
        adharno: maps[index]['adharno'],
        phone: maps[index]['phone'],
        dropdownValue: maps[index]['dropdownValue'],
        name: maps[index]['name'],
        amt: maps[index]['amt'],
        selectedCategory: maps[index]['selectedCategory'],
        email: maps[index]['email'],
        url: maps[index]['url'],


      );
    });
  }


  Future<int> updateWorker(Worker worker) async {
    await openDB();
    return await _datebase.update('worker', worker.toMap(), where: 'id=?', whereArgs: [worker.id]);
  }

  Future<void> deleteWoker(String? id) async {
    await openDB();
    await _datebase.delete("worker", where: "id = ? ", whereArgs: [id]);
  }
}

