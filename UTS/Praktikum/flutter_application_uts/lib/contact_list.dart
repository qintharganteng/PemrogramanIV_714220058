import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactList();
}

class _ContactList extends State<ContactList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _myDataList = [];
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();

  Color _currentColor = Colors.blue; // Default color
  Map<String, dynamic>? editedData;
  File? _imageFile;
  String? _dataFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form - Input',
          style: TextStyle(
            fontFamily: 'Nabla',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Input Nama
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerNama,
                    validator: _validateNama,
                    style: const TextStyle(
                        color: Color.fromARGB(
                            255, 218, 215, 215)), // Warna font saat mengetik
                    decoration: InputDecoration(
                      hintText: 'Write your name here...',
                      labelText: 'Name',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(
                              115, 255, 255, 255)), // Warna hint teks
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(
                              255, 255, 255, 255)), // Warna label teks
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 0, 0, 0), // Warna border saat tidak fokus
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white, // Warna border saat fokus
                          width: 2.0,
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 14, 15, 15),
                      filled: true,
                    ),
                  ),
                ),

                // Input Phone Number
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerPhone,
                    keyboardType: TextInputType.phone,
                    validator: _validatePhone,
                    decoration: const InputDecoration(
                      hintText: 'Enter your phone number...',
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 0, 0, 0),
                      filled: true,
                    ),
                  ),
                ),

                // Input Date
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerDate,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            "${pickedDate.toLocal()}".split(' ')[0];
                        setState(() {
                          _controllerDate.text = DateFormat('dd-MM-yyyy')
                              .format(DateTime.parse(formattedDate));
                        });
                      }
                    },
                    validator: _validateDate,
                    decoration: const InputDecoration(
                      hintText: 'Select your date...',
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 12, 12, 12),
                      filled: true,
                      suffixIcon:
                          Icon(Icons.calendar_today, color: Colors.grey),
                    ),
                  ),
                ),

                // Color Picker
                buildColorPicker(context),

                // File Picker
                buildFilePicker(context),

                // Submit Button
                ElevatedButton(
                  child: Text(editedData != null ? "Update" : "Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addData();
                    }
                  },
                ),

                // Display List Data
                const SizedBox(height: 20),
                const Text(
                  'List Contact',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _myDataList.map((data) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              backgroundImage: data['filePreview'] != null
                                  ? FileImage(data['filePreview'])
                                  : null,
                              child: data['filePreview'] == null
                                  ? Text(
                                      data['name']?[0]?.toUpperCase() ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )
                                  : null,
                            ),
                            title: Text(data['name'] ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone: ${data['phone']}'),
                                Text('Date: ${data['date']}'),
                                const SizedBox(
                                  height: 4,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: LinearProgressIndicator(
                                    value: 1.0,
                                    color: data['color'],
                                    backgroundColor:
                                        data['color'].withOpacity(0.3),
                                    minHeight: 8,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _editData(data);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _deleteData(data);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Color Picker Widget
  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _currentColor,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick your color'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        )
      ],
    );
  }

  // File Picker Widget
  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Pick File'),
        const SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              backgroundImage:
                  _imageFile != null ? FileImage(_imageFile!) : null,
              child: _imageFile == null
                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                  : null,
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text('Pick Image'),
            ),
          ],
        ),
        if (_dataFile != null) Text('File: $_dataFile'),
        const SizedBox(height: 10),
      ],
    );
  }

  // Validation Methods
  String? _validateNama(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi';
    }
    List<String> words = value.trim().split(' ');
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }
    for (String word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
        return 'Setiap kata harus dimulai dengan huruf kapital dan tidak mengandung angka atau karakter khusus';
      }
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi';
    }

    // Only number
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }

    // 8-13 digit
    if (value.length < 8 || value.length > 13) {
      return 'Nomor telepon harus memiliki panjang antara 8 hingga 13 digit';
    }

    // "62"
    if (!value.startsWith('62')) {
      return 'Nomor telepon harus dimulai dengan angka 62';
    }

    return null;
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal harus diisi';
    }
    return null;
  }

  // Add Data Method
  void _addData() {
    Map<String, dynamic> data = {
      'name': _controllerNama.text,
      'phone': _controllerPhone.text,
      'date': _controllerDate.text,
      'color': _currentColor,
      'filePreview': _imageFile,
    };
    setState(() {
      if (editedData == null) {
        _myDataList.add(data);
      } else {
        int index = _myDataList.indexOf(editedData!);
        _myDataList[index] = data;
        editedData = null;
      }
    });
    _clearForm();
  }

  // Edit Data Method
  void _editData(Map<String, dynamic> data) {
    setState(() {
      _controllerNama.text = data['name'];
      _controllerPhone.text = data['phone'];
      _controllerDate.text = data['date'];
      _currentColor = data['color'];
      _imageFile = data['filePreview'];
      editedData = data;
    });
  }

  // Delete Data Method
  void _deleteData(Map<String, dynamic> data) {
    setState(() {
      _myDataList.remove(data);
    });
  }

  // Clear Form Method
  void _clearForm() {
    _controllerNama.clear();
    _controllerPhone.clear();
    _controllerDate.clear();
    setState(() {
      _currentColor = Colors.blue;
      _imageFile = null;
      _dataFile = null;
    });
  }

  // Pick File Method
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _dataFile = result.files.single.name;
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
  }
}
