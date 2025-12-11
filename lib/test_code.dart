import 'package:flutter/material.dart';

class AuthFile extends StatefulWidget {
  const AuthFile({super.key});

  @override
  State<AuthFile> createState() => _AuthFileState();
}

class _AuthFileState extends State<AuthFile> {
  int selected = 0;
  Color colrs = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: selected == 0 ? colrs : Colors.blueAccent,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selected == 0 ? colrs : Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: selected == 0 ? colrs : Colors.deepPurple,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selected == 0 ? colrs : Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
