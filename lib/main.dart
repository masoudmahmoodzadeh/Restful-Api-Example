import 'package:flutter/material.dart';
import 'package:restful_api_example/apis/base/api_manager.dart';
import 'package:restful_api_example/apis/base/response_callback.dart';
import 'package:restful_api_example/apis/list_crypto/list_crypto_request.dart';
import 'package:restful_api_example/apis/list_crypto/list_crypto_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restful Api Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListCryptoResponse> listCrypto = [];

  @override
  void initState() {
    _getListCrypto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restful Api Example"),
      ),
      body: Center(
        child: listCrypto.isEmpty
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: listCrypto.length,
                itemBuilder: (context, index) {
                  ListCryptoResponse item = listCrypto[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.symbol),
                      const SizedBox(height: 16),
                      Text(item.price),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.blue,
                    thickness: 1,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _getListCrypto() {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(ListCryptoRequest(),
        ResponseCallback<List<ListCryptoResponse>>(
      onSuccess: ((json) {
        List<ListCryptoResponse> data = (json as List)
            .map((item) => ListCryptoResponse.fromJson(item))
            .toList();

        setState(() {
          listCrypto = data;
        });
      }),
    ));
  }
}
