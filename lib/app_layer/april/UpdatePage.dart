import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _day = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)?.settings.arguments as Map;

    int id = int.parse(todo['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      child: BlocProvider(create: (context) {
        _listBloc.add(GetDrugList(a));
        return _listBloc;
      },),
      ),
    );
  }
}
