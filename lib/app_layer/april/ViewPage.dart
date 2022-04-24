import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/business_layer/controller/View/view_april_data_bloc.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewAprilDataBloc viewAprilDataBloc = ViewAprilDataBloc();
    final todo = ModalRoute.of(context)?.settings.arguments as Map;
    int id = int.parse(todo['id']);

    return Scaffold(
        appBar: AppBar(
          title: const Text('View Page'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
            create: (context) {
              viewAprilDataBloc.add(GetAprilData(id));
              return viewAprilDataBloc;
            },
            child: BlocBuilder<ViewAprilDataBloc, ViewAprilDataState>(
                builder: (context, state) {
              if (state is ViewAprilDataInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is ViewAprilLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is ViewAprilLoad) {
                return UI(context,state.aprilModel.day.toString(),state.aprilModel.name);
              }
              else
                {
                  return Container();
                }
            }),
          ),
        ));
  }
}

Widget UI(context, day, name)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       Text('Name :' + name,style: const TextStyle(fontSize: 20),),
      Text('day :' + day.toString(),style: const TextStyle(fontSize: 20)),
    ],
  );
}