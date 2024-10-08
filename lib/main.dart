import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardExpirationDateController = TextEditingController();
  final _cardCvcController = TextEditingController();

  final ValueNotifier<bool> _isFormValid = ValueNotifier<bool>(false);

  MyApp({super.key});

  String? validateName(String value) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value)
        ? null
        : 'firstname not valid';
  }

  String? validateAddress(String value) {
    return RegExp(r'^[a-zA-Z0-9\s,\.]+$').hasMatch(value)
        ? null
        : 'lastname not valid';
  }

  String? validateCardNumber(String value) {
    return RegExp(r'^\d{16}$').hasMatch(value) ? null : 'card digits not valid';
  }

  String? validateExpirationDate(String value) {
    return RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)
        ? null
        : 'epiration date on card not valid (MM/YY)';
  }

  String? validateCVC(String value) {
    return RegExp(r'^\d{3}$').hasMatch(value) ? null : 'CVC not valid';
  }

  void _validateForm() {
    bool isValid = _formKey.currentState!.validate();
    _isFormValid.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fields validation',
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Firstname',
                      errorText: validateName(_firstnameController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Lastname',
                      errorText: validateName(_lastnameController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Address',
                      errorText: validateAddress(_addressController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Card digits',
                      errorText: validateCardNumber(_cardNumberController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cardExpirationDateController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '(MM/YY)',
                      errorText: validateExpirationDate(
                          _cardExpirationDateController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cardCvcController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'CVC',
                      errorText: validateCVC(_cardCvcController.text),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      _validateForm();
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isFormValid,
                    builder: (context, isValid, child) {
                      return FilledButton(
                        onPressed: isValid
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('fields send successfully'),
                                  ),
                                );
                              }
                            : null,
                        child: const Text('Send'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
