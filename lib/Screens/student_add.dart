import 'package:first_app/Models/Student.dart';
import 'package:first_app/Validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student>students;
  StudentAdd(List<Student>students){
 this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student>students;
  _StudentAddState(List<Student>students){
    this.students = students;
  }
  var student = Student.withOutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekleme Sayfası"),
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),

        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
             buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildImageField(),
              buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }

Widget  buildFirstNameField() {
 return TextFormField(
    decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Furkan"),
    validator:validateFirstName ,
    onSaved: (String value){
      student.firstName = value;
    },
  );
}

 Widget buildLastNameField() {
   return TextFormField(
     decoration: InputDecoration(labelText: "Öğrenci SoyAdı",hintText: "Fidan"),
     validator:validateLastName ,
     onSaved: (String value){
       student.lastName = value;
     },
   );
 }

Widget  buildGradeField() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Öğrenci Puanı",hintText: "65"),
    validator:validateGrade ,
    onSaved: (String value){
      student.grade = int.parse(value);
    },
  );
  }

 Widget buildSubmitButton() {
return RaisedButton(
  child: Text("Öğrenci Ekle"),
  color: Colors.cyanAccent,
  onPressed:(){

if(formKey.currentState.validate()){
  formKey.currentState.save();
  students.add(student);
  
  saveStudent();
  Navigator.pop(context);
}
  },
);
  }

  void saveStudent() {

    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }

 Widget buildImageField() {
   return TextFormField(

     decoration: InputDecoration(labelText: "Öğrenci Resim Adresi",hintText: "Resim Adresi"),
     validator:validateLastName ,
     onSaved: (String value){
       student.image = value;
     },
   );
  }
}
