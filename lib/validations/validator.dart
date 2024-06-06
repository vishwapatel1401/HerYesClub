

class Validator{
  static String? validateField({required String value}){
    if(value.isEmpty){
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? validateUserid({required String user_id}){
    if(user_id.isEmpty){
      return 'User ID cannot be empty';
    }
    else if(user_id.length <=6){
      return 'User ID cannot be less than 6 characters';
    }
    return null;
  }

  static String? validatePassword({required String password}){
    if(password.isEmpty){
      return 'User ID cannot be empty';
    }
    else if(password.length <=6){
      return 'User ID cannot be less than 6 characters';
    }
    return null;
  }

}