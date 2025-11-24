import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  MemberCard({
    super.key,
    required this.name,
    required this.className,
    required this.major,
    required this.gender,
    required this.age,
    required this.onEdit,
    required this.onDelete,
  });

  String name = "";
  String className = "";
  String major = "";
  String gender = "";
  int age = 0;
  VoidCallback onEdit;
  VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: $name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                Text("Class: $className", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                Text("Gender: $gender", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                Text("Major: $major", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                Text("age: $age", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  color: Colors.yellowAccent[700],
                  onPressed: onEdit,
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  color: Colors.redAccent[700],
                  onPressed: onDelete,
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
