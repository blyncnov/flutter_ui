import "package:flutter/material.dart";
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
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> transactions = <Transaction>[];

  final controlTextvalue = TextEditingController();
  final controlTextAmount = TextEditingController();

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SizedBox(
                height: 200,
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Instant Transfer successful",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 52, 51, 51),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "You've successful transferred N200,00.00 to 5049752018",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 51, 51),
                            fontSize: 15)),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("(TAIWO BOLUWATIFE JEREMIAH of FCMB)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 51, 51),
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                        color: Color.fromARGB(255, 52, 51, 51), thickness: 0.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Continue",
                            style: TextStyle(
                                color: Color.fromARGB(220, 89, 22, 116),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        Container(
                          height: 30,
                          width: 0.6,
                          color: const Color.fromARGB(255, 52, 51, 51),
                        ),
                        const Text("View Receipt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(220, 89, 22, 116),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Expense Keeper', textAlign: TextAlign.center),
            GestureDetector(
              onTap: () => _startAddNewTransaction(context),
              child: const Icon(Icons.add),
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 22, 109, 240),
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
              color: const Color.fromARGB(255, 22, 109, 240),
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
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: ElevatedButton(
                              style: const ButtonStyle(),
                              onPressed: () {
                                setState(() {
                                  transactions.add(
                                    Transaction(
                                      id: transactions.length.toString(),
                                      title: controlTextvalue.text,
                                      amount:
                                          double.parse(controlTextAmount.text),
                                      date: DateTime.now(),
                                    ),
                                  );
                                });
                              },
                              child: const Text('Add Transaction'),
                            ),
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
            Expanded(
                child: transactions.isEmpty
                    ? const Center(
                        child: Text("No Transaction Found",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 201, 200, 200))),
                      )
                    : ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 10,
                              right: 10,
                            ),
                            child: Card(
                              elevation: 1,
                              child: ListTile(
                                onTap: () {
                                  // ignore: avoid_print
                                  print("Tile is Tapped");
                                },
                                leading: const FlutterLogo(),
                                trailing: InkWell(
                                  onTap: () {
                                    // ignore: avoid_print
                                    print("Inkwell Button is Tapped");
                                  },
                                  child: Ink(
                                    child: const Icon(Icons.delete_forever),
                                  ),
                                ),
                                title: Text(' ${transactions[index].title} '),
                              ),
                            ),
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
