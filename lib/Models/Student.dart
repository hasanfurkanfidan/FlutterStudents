

class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String image;
  String status;

  Student.WithId(int id,String firstName, String lastName, int grade, String image) {
    this.id = id;
    this.firstName = firstName;
    this.grade = grade;
    this.lastName = lastName;
    this.image = image;

  }
  Student(String firstName, String lastName, int grade, String image) {

    this.firstName = firstName;
    this.grade = grade;
    this.lastName = lastName;
    this.image = image;

  }
  Student.withOutInfo(){

      }
String get getStatus{

String message = "";
    if (this.grade > 50) {
      message = "Geçti";

    }
    else if (this.grade > 40) {
      message = "bütünleme";
    }
    else {
      message = "Kaldı";
    }
    return message;

}
}