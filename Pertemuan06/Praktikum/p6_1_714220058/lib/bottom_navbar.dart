import 'package:flutter/material.dart';
import 'package:p6_1_714220058/input_form.dart';
import 'package:p6_1_714220058/input_validator.dart';
import 'main.dart';

class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});

  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = <Widget>[
    const MyInput(),
    const MyFormValidation(),
    const MyInputForm(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input_outlined),
            label: 'Form Validation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_form_rounded),
            label: 'Form Input',
          ),
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.amber,
      ),
    );
  }
}

class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  TextEditingController _controller = TextEditingController();
  bool LightOn = false;
  bool dart = false;
  bool agree = false;

  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.00),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: const Text('Sumbit'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Hello, ${_controller.text}'),
                        );
                      });
                }),
            Switch(
              value: LightOn,
              onChanged: (bool value) {
                setState(() {
                  LightOn = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(LightOn ? 'Light On' : 'Light Off'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(
                    value: 'Dart',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(dart ? 'Dart Selected' : 'Dart Selected'),
                      ));
                    },
                  ),
                  title: Text('Dart'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Kotlin',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(dart ? 'Kotlin Selected' : 'Kontlin Selected'),
                      ));
                    },
                  ),
                  title: Text('Kotlin'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Swift',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(dart ? 'Swift Selected' : 'Swift Selected'),
                      ));
                    },
                  ),
                  title: Text('Swift'),
                ),
              ],
            ),
            ListTile(
              leading: Checkbox(
                  value: agree,
                  onChanged: (bool? value) {
                    setState(() {
                      agree = value!;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(agree ? 'Agree' : 'Disagree'),
                    ));
                  }),
              title: Text('Agree / Disagree'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showSnackbar() {}
}
