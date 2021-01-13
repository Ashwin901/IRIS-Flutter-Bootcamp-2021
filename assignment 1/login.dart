import 'dart:io';

Map<String, String> users = {
  "Steve": "123456",
  "Mark": "654321",
  "John": "987456"
};

void checkLogin(String name) {
  if (users[name] == null) {
    print("-----------Invalid username-----------");
  } else {
    print("Enter password");
    String password = stdin.readLineSync();
    if (password == users[name]) {
      print("-----------Login successful-----------");
    } else {
      print("-----------Invalid password-----------");
    }
  }
}

void main() {
  print("Enter your name");
  String name = stdin.readLineSync();
  checkLogin(name);
}
