import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/db/sqldb.dart';

class SqlExample_1 extends StatelessWidget {
  SqlExample_1({super.key});

  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SqlExample 1"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("Insert Data", style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    int response = await sqlDb.insertData("INSERT INTO 'notes'('note') VALUES ('note two')");
                    print(response);
                  }
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.deepPurple,
                  child: const Text("Read Data", style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");
                    print("$response");
                  }
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.red,
                  child: const Text("Delete Data", style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    int response = await sqlDb.deleteData("DELETE FROM 'notes' WHERE id = 1 ");
                    print("$response");
                  }
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.teal,
                  child: const Text("Update Data", style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    int response = await sqlDb.updateData("UPDATE 'notes' SET 'note' = 'note one' WHERE id = 2");
                    print("$response");
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
