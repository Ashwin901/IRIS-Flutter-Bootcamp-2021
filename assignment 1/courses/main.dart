import 'dart:io';
import 'open_elective.dart';
import 'branch_elective.dart';

List<OpenElective> open_electives = [
  OpenElective(courseName: "FM1", courseCode: "som100"),
  OpenElective(courseName: "SOM", courseCode: "som101"),
  OpenElective(courseName: "HRM", courseCode: "som102"),
  OpenElective(courseName: "GE", courseCode: "som103"),
  OpenElective(courseName: "CA", courseCode: "som104"),
  OpenElective(courseName: "SA", courseCode: "som105"),
];
List<BranchElective> branch_electives = [
  BranchElective(
      courseName: "DSA", courseCode: "cs202", branch: "cs", year: "2020"),
  BranchElective(
      courseName: "OS", courseCode: "cs201", branch: "cs", year: "2021"),
  BranchElective(
      courseName: "DDS", courseCode: "cs200", branch: "ee", year: "2020"),
  BranchElective(
      courseName: "COAA", courseCode: "cs203", branch: "ee", year: "2021"),
  BranchElective(
      courseName: "AP", courseCode: "cs204", branch: "it", year: "2020"),
  BranchElective(
      courseName: "WD", courseCode: "cs205", branch: "it", year: "2021"),
];

void adminAccess() {
  int choice;
  print("Enter course type 1.Open elective   2.Branch elective");
  choice = int.parse(stdin.readLineSync());
  String courseName, courseCode, branch, year;
  if (choice == 1) {
    print("Enter course name and course code");
    courseName = stdin.readLineSync();
    courseCode = stdin.readLineSync();
    OpenElective elective =
        OpenElective(courseCode: courseCode, courseName: courseName);
    open_electives.add(elective);
    print("course successfully added");
  } else if (choice == 2) {
    print("Enter course name,course code,branch and year");
    courseName = stdin.readLineSync();
    courseCode = stdin.readLineSync();
    branch = stdin.readLineSync();
    year = stdin.readLineSync();
    BranchElective elective = BranchElective(
        courseCode: courseCode,
        courseName: courseName,
        branch: branch,
        year: year);
    branch_electives.add(elective);
    print("course successfully added");
  } else {
    print("Wrong choice");
  }
}

void studentAccess() {
  String branch, year;
  print("Enter branch and year");
  branch = stdin.readLineSync();
  year = stdin.readLineSync();

  print("----open electives----");
  for (int i = 0; i < open_electives.length; i++) {
    print(open_electives[i].courseName + " " + open_electives[i].courseCode);
  }
  print("----branch electives----");
  int count = 0;
  for (int i = 0; i < branch_electives.length; i++) {
    if (branch_electives[i].branch == branch &&
        branch_electives[i].year == year) {
      count++;
      print(branch_electives[i].courseName +
          " " +
          branch_electives[i].courseCode +
          " " +
          branch_electives[i].branch +
          " " +
          branch_electives[i].year);
    }
  }
  if (count == 0) {
    print("No courses available");
  }
}

void main() {
  int choice;
  print("Enter type of student 1.Admin   2.Student");
  choice = int.parse(stdin.readLineSync());

  switch (choice) {
    case 1:
      adminAccess();
      break;
    case 2:
      studentAccess();
      break;
    default:
      print("wrong choice");
      break;
  }
}
