import 'package:flutter/material.dart';
import 'package:loginapp/providers/edit_profile_provider.dart';
import 'package:loginapp/widgets/custom_form.dart';
import 'package:loginapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: CustomText(
          text: "Edit Profile",
          color: Colors.white,
        ),
      ),
      body: Consumer<EditProfileProvider>(builder: (context, value, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormInput(
                  labelText: "Name",
                  pIcon: Icons.person,
                  errorMsg: "Please Enter Name",
                  controller: value.editNameController),
              CustomFormInput(
                  type: TextInputType.phone,
                  labelText: "Phone",
                  pIcon: Icons.phone,
                  errorMsg: "Please Enter Phone Number",
                  controller: value.editPhoneController),
            ],
          ),
        );
      }),
    );
  }
}
