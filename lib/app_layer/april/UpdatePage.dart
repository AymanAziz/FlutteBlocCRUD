import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/business_layer/DB/Model/aprilModel.dart';
import 'package:testaapril/business_layer/controller/Update/update_april_bloc.dart';

import '../../business_layer/DB/Model/aprilModel.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _day = TextEditingController();
  final UpdateAprilBloc _updateAprilBloc = UpdateAprilBloc();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Update April Data'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
              create: (context) {
                _updateAprilBloc.add(GetAprilData(id));
                return _updateAprilBloc;
              },
              child: BlocBuilder<UpdateAprilBloc, UpdateAprilState>(
                builder: (context, state) {
                  if (state is UpdateAprilInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAprilLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpdateAprilLoad) {
                    _name.text = state.aprilModel.name;
                    _day.text = state.aprilModel.day.toString();


                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: _name,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Name',
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
                                        controller: _day,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Day',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select a day';
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
                                              AprilModel aprilModel = AprilModel(
                                                  id: id,
                                                  name: _name.text,
                                                  day: int.parse(_day.text));

                                              //update to bloc
                                              _updateAprilBloc.add(UpdateAprilData(aprilModel));

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
                                )))
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

Widget FormAprilUpdate(
    context, _name, _day, id, aprilModel, _updateAprilBloc, _formKey) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
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
                      controller: _day,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Day',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a day';
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
                            aprilModel(
                                id: id,
                                name: _name.text,
                                day: int.parse(_day.text));

                            //update to bloc
                            _updateAprilBloc.add(UpdateAprilData(aprilModel));

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
              )))
    ],
  );
}
