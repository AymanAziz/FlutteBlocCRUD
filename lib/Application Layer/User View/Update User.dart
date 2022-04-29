import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/Services Layer/User%20Controller/user_bloc.dart';
import 'package:testaapril/Data%20Layer/Model/User%20Model.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({Key? key}) : super(key: key);

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  final UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Update User Data'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                userBloc.add(GetUserData(id));
                return userBloc;
              },
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateUserLoad) {
                    _name.text = state.userModel.name;
                    _age.text = state.userModel.age.toString();


                    return ListView(
                      children: [
                        const SizedBox(height: 30,),
                        Card(
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                          child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            labelText: 'Enter your age',
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
                                          padding: const EdgeInsets.fromLTRB(70, 30, 70, 10),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (_formKey.currentState!.validate()) {
                                                //add to model
                                                UserModel userModel = UserModel(
                                                    id: id,
                                                    name: _name.text,
                                                    age: int.parse(_age.text));

                                                //update to bloc
                                                userBloc.add(UpdateUserData(userModel));

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Data Added Successfully'),
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
                                  )),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )),
    );
  }
}
