import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editPhoneController = TextEditingController();

  TextEditingController get editNameController => _editNameController;
  TextEditingController get editPhoneController => _editPhoneController;
}
