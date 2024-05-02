import 'package:flutter/material.dart';
import 'package:soko_v2/widgets/primary_filled_button.dart';

class EditEmailScreen extends StatefulWidget {
  final String email;

  const EditEmailScreen({
    super.key,
    required this.email,
  });

  @override
  createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  void initState() {
    super.initState();
    _email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Email'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              initialValue: _email,
              style: Theme.of(context).textTheme.bodySmall,
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            PrimaryFilledButton(
              text: 'Save',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, _email);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
