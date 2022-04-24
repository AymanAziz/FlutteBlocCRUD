import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapril/app_layer/april/AddPage.dart';
import 'package:testaapril/app_layer/april/UpdatePage.dart';
import 'package:testaapril/business_layer/controller/Index/index_april_bloc.dart';

class IndexAprilScreen extends StatefulWidget {
  const IndexAprilScreen({Key? key}) : super(key: key);

  @override
  State<IndexAprilScreen> createState() => _IndexAprilScreenState();
}

class _IndexAprilScreenState extends State<IndexAprilScreen> {
  final IndexAprilBloc _indexAprilBloc = IndexAprilBloc();

  //get data when initial this state
  @override
  void initState() {
    _indexAprilBloc.add(GetAprilList());
    super.initState();
  }


  //refresh when pop
  onGoBack(dynamic value) {
    setState(() {
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('index page'),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPage()),
                    ).then(onGoBack);
                  },
                );
              },
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (_) => _indexAprilBloc,
              child: BlocBuilder<IndexAprilBloc, IndexAprilState>(
                  builder: (context, state) {
                if (state is IndexAprilInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexAprilLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is IndexAprilLoad) {
                  return _UI(context, state.listApril);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
        ),
      ),
    );
  }
}

//display list data
Widget _UI(BuildContext context, state) {
  return ListView.builder(
      itemCount: state == null ? 0 : state.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UpdatePage(),
                    settings: RouteSettings(
                      arguments: {
                        "id": state[index].id.toString(),
                        // "name": state[index].name.toString(),
                        // "day": state[index].day.toString(),
                      },
                    )));
          },
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              state[index].name.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(state[index].day.toString()),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
