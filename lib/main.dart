import 'package:first_app/Models/Student.dart';
import 'package:first_app/Screens/Student_edit.dart';
import 'package:first_app/Screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
     Student.WithId(1,"Furkan", "Fidan", 45,
        "https://cdn.pixabay.com/photo/2015/07/17/22/42/typing-849806_1280.jpg"),
     Student.WithId(2,"Fethi", "Çekinmez", 74,
        "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_1280.jpg")
  ];

  Student selectedStudent = new Student.WithId(0,"","",0,"");

  String mesaj = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody(context));
  }

  void AlertVer(BuildContext context,String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                       selectedStudent = students[index];

                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci: " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 5.0),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students))).then((value) {
                      setState(() {

                      });
                    });
                  },
                ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent))).then((value) {
                    setState(() {

                    });
                  });
                },
              ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "silindi";
                  AlertVer(context,mesaj);
                },
              ),

            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return Icon(Icons.done);
    }
    if (grade > 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
} //class
