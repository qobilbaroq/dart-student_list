import 'package:flutter/material.dart';
import 'package:list_student/widgets/member_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> studentList = [];
  String selectedClass = "X";
  String selectedMajor = "PPLG";
  String selectedGender = "male";

  TextEditingController studentName = TextEditingController();
  TextEditingController age = TextEditingController();

  final List<DropdownMenuEntry<String>> listClasses = [
    DropdownMenuEntry(value: "X", label: "X"),
    DropdownMenuEntry(value: "XI", label: "XI"),
    DropdownMenuEntry(value: "XII", label: "XII"),
  ];

  final List<DropdownMenuEntry<String>> listMajors = [
    DropdownMenuEntry(value: "PPLG", label: "pengembangan perangkat lunak dan game"),
    DropdownMenuEntry(value: "TKJ", label: "teknik komputer dan jaringan"),
    DropdownMenuEntry(value: "ANIMASI", label: "animasi"),
    DropdownMenuEntry(value: "MULTIMEDIA", label: "multimedia"),
    DropdownMenuEntry(value: "BC", label: "broadcasting"),
  ];

  final List<DropdownMenuEntry<String>> listGender = [
    DropdownMenuEntry(value: "male", label: "Male"),
    DropdownMenuEntry(value: "female", label: "Female"),
  ];

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Add New Member",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: studentName,
                  decoration: InputDecoration(
                    labelText: "Student Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownMenu(
                  initialSelection: selectedClass,
                  width: double.infinity,
                  label: Text("Class"),
                  dropdownMenuEntries: listClasses,
                  onSelected: (value) {
                    setState(() {
                      selectedClass = value!;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownMenu(
                  initialSelection: selectedMajor,
                  width: double.infinity,
                  label: Text("Major"),
                  dropdownMenuEntries: listMajors,
                  onSelected: (value) {
                    setState(() {
                      selectedMajor = value!;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownMenu(
                  initialSelection: selectedGender,
                  width: double.infinity,
                  label: Text("Gender"),
                  dropdownMenuEntries: listGender,
                  onSelected: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    studentList.add({
                      "name": studentName.text,
                      "class": selectedClass,
                      "major": selectedMajor,
                      "gender": selectedGender,
                      "age": int.tryParse(age.text) ?? 0,
                    });
                  });

                  Navigator.pop(context);

                  studentName.clear();
                  age.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 44),
                ),
                child: Text("Add Member", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Home Page",
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        color: Color.fromARGB(255, 223, 235, 234),
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            final item = studentList[index];
            return MemberCard(
              name: item["name"],
              className: item["class"],
              major: item["major"],
              gender: item["gender"],
              age: item["age"],
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _showModalSheet,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
