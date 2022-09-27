import "package:flutter/material.dart";
import 'package:learning_flutter/screens/product-details.dart';
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class ExpenseApp extends StatelessWidget {
  ExpenseApp({super.key});

  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoe",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "New Coding Gera",
      amount: 269.99,
      date: DateTime.now(),
    )
  ];

  // String textValue = '';
  // String amountValue = '';

  final controlTextvalue = TextEditingController();
  final controlTextAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker', textAlign: TextAlign.center),
        centerTitle: false,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.blueGrey,
              elevation: 3,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Title',
                                hintText: "Enter your text "),
                            controller: controlTextvalue,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Amount', hintText: "Enter amount "),
                            controller: controlTextAmount,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print(controlTextvalue.text);
                              // ignore: avoid_print
                              print(controlTextAmount.text);
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'List of Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Card(
            //   child: Container(
            //     padding: const EdgeInsets.all(8.0),
            //     child: const Text(
            //       'List of Transactions',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[400],
//         title: const Text("Dog Pethub"),
//         centerTitle: false,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: const <Widget>[
//             Image(
//               image: AssetImage('lib/assets/dog.jpg'),
//             ),
//             Card(
//               child: Text("Dog Pethub"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
