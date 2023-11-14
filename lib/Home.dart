import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double firstValue = 0;
  double secondValue = 0;
  double solution = 0;
  String operation = "+";
  String resultText = "";
  late TextEditingController controllerFirstValue;
  late TextEditingController controllerSecondValue;
  @override
  void initState() {
    // TODO: implement initState
    controllerFirstValue = TextEditingController();
    controllerSecondValue = TextEditingController();
    super.initState();
  }

  String calculate() {
    if (controllerFirstValue.text != "" && controllerSecondValue.text != "") {
      firstValue = double.parse(controllerFirstValue.text);
      secondValue = double.parse(controllerSecondValue.text);
      if (operation == "+") {
        solution = firstValue + secondValue;
      } else if (operation == "-") {
        solution = firstValue - secondValue;
      } else if (operation == "x") {
        solution = firstValue * secondValue;
      } else {
        solution = firstValue / secondValue;
      }
      return solution.toString();
    }
    return "Inform valid numbers.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the first value",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: controllerFirstValue,
            ),
            DropdownButton(
              value: operation,
              items: const [
                DropdownMenuItem(
                  child: Text("+"),
                  value: "+",
                ),
                DropdownMenuItem(
                  child: Text("-"),
                  value: "-",
                ),
                DropdownMenuItem(
                  child: Text("x"),
                  value: "x",
                ),
                DropdownMenuItem(
                  child: Text("÷"),
                  value: "÷",
                )
              ],
              onChanged: (value) {
                setState(() {
                  operation = value.toString();
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the second value",
                border: OutlineInputBorder(),
              ),
              controller: controllerSecondValue,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    this.resultText = calculate();
                  });
                },
                child: Text("Calculate")),
            Text(
              resultText,
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
