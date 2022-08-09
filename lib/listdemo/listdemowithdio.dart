import 'package:flutter/material.dart';
import 'package:untitled1/listdemo/models/postdio.dart';
import 'package:untitled1/listdemo/repository/post_repository.dart';
import 'models/post.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: ListDemowithDio()));
}

class ListDemowithDio extends StatefulWidget {
  const ListDemowithDio({Key? key}) : super(key: key);

  @override
  State<ListDemowithDio> createState() => _ListDemowithDioState();
}

class _ListDemowithDioState extends State<ListDemowithDio> {
  List<Post>? posts;
  var isLoaded = false;

  // late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await PostRepository().getPostData();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dio Networking")),
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Container(

                  child: Row(
                    children: [

                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(posts![index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10),
                            Text(posts![index].body ?? '',
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
