import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/Services Layer/User%20Controller/user_bloc.dart';
import 'package:testaapril/Data%20Layer/Model/User%20Model.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _age = TextEditingController();
    final UserBloc userBloc = UserBloc();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('add User Data'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
              create: (_) => userBloc,
              child:  ListView(
                children: [
                  const SizedBox(height: 30,),
                  Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 10, right: 10,top: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _age,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter age',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a age';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      70, 30, 70, 10),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        //add to model
                                        UserModel userModel = UserModel(
                                            name: _name.text,
                                            age: int.parse(_age.text));

                                        //add to bloc
                                        userBloc
                                            .add(InsertUserData(userModel));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Data Added Successfully'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),),
        ),
      ),
    );
  }
}
