import 'package:first_app/Models/Student.dart';
import 'package:first_app/Validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  _StudentAddState(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }

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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Furkan"),
      validator:validateFirstName ,
      onSaved: (String value){
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci SoyAdı",hintText: "Fidan"),
      validator:validateLastName ,
      onSaved: (String value){
        selectedStudent.lastName = value;
      },
    );
  }

  Widget  buildGradeField() {

    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Öğrenci Puanı",hintText: "65"),
      validator:validateGrade ,
      onSaved: (String value){
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Öğrenci Güncelle"),
      color: Colors.cyanAccent,
      onPressed:(){

        if(formKey.currentState.validate()){
          formKey.currentState.save();


          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {

    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }

  Widget buildImageField() {
    return TextFormField(
      initialValue: selectedStudent.image,
      decoration: InputDecoration(labelText: "Öğrenci Resim Adresi",hintText: "Resim Adresi"),
      validator:validateLastName ,
      onSaved: (String value){
        selectedStudent.image = value;
      },
    );
  }
}
