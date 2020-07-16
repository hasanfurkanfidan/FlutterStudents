class StudentValidationMixin{
  String validateFirstName(String value){
    if(value.length<2){
      return "İsim en az 2 karakter olmalıdır..";
    }
  }
  String validateLastName(String value){
    if(value.length<2){
      return "Soyisim en az 2 karakter olmalıdır..";
    }
  }
  String validateGrade(String value){
    if(int.parse(value)<0){
      return "Not 0 dan düşük olamaz";
    }
  }

}