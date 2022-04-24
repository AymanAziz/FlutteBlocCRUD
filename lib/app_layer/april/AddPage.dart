import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/business_layer/DB/Model/aprilModel.dart';
import 'package:testaapril/business_layer/controller/Add/add_april_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _day = TextEditingController();
    final AddAprilBloc addAprilBloc = AddAprilBloc();
    
    
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: GestureDetector(
            onTap: (){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: BlocProvider(create: (_) =>addAprilBloc,child: Column(
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
                              const SizedBox(height: 20,),
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

                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(70, 30, 70, 10),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {

                                      //add to model
                                      AprilModel aprilmodel  = AprilModel( name: _name.text, day: int.parse(_day.text));

                                      //add to bloc
                                      addAprilBloc.add(InsertAprilData(aprilmodel));



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
            )),),
          ),
        );
  }
}
