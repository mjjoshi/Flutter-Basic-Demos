import 'package:flutter/material.dart';
import 'package:untitled1/listdemo/repository/post_repository.dart';
import 'models/post.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: ListDemo()));
}

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await PostRepository().fetchPostData();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTTP networking")),
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
                  padding: const EdgeInsets.all(16),
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
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(posts![index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            Text(posts?[index].body ?? '',
                                maxLines: 2, overflow: TextOverflow.ellipsis)
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
