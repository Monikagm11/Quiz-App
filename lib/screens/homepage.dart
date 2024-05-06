import 'package:flutter/material.dart';
import 'package:quizapp/models/list_data_model.dart';
import 'package:quizapp/repository/api_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Datum> data = [];
  _loaddata() async {
    try {
      final retrivedata = await GetListApi().getobjectlistapi();
      data = retrivedata;
      return data;
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    // _loaddata();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 164, 211, 247),
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FutureBuilder<dynamic>(
            future: _loaddata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) => Card(
                        color: const Color.fromARGB(255, 200, 227, 248),
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: size.height * 0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].question,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                              Text(
                                snapshot.data![index].answer,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                    // ListTile(
                    //   tileColor: const Color.fromARGB(255, 185, 209, 228),
                    //   title:Text(data[index].question),
                    //   subtitle: Text(data[index].answer),
                    // ),
                    );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("No Data"),
                );
              }
            }),
      ),
    );
  }
}
