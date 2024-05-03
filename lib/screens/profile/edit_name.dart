import 'package:flutter/material.dart';
import 'package:soko_v2/widgets/primary_filled_button.dart';

class EditNameScreen extends StatefulWidget {
  final String fullName;

  const EditNameScreen({
    super.key,
    required this.fullName,
  });

  @override
  createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    List<String> names = widget.fullName.split(' ');
    String firstName = names.isNotEmpty ? names.first : '';
    String lastName = names.length > 1 ? names.sublist(1).join(' ') : '';
    _firstNameController = TextEditingController(text: firstName);
    _lastNameController = TextEditingController(text: lastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: _firstNameController,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _lastNameController,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            PrimaryFilledButton(
              text: 'Save',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // This is where you might save the names or pass them back to a previous page
                  Navigator.pop(context,
                      '${_firstNameController.text} ${_lastNameController.text}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
