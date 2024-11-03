import 'package:bull_cow/view/game_screen.dart';
import 'package:flutter/material.dart';

class GameSetupScreen extends StatefulWidget {
  @override
  _GameSetupScreenState createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends State<GameSetupScreen> {
  String player1Name = '';
  String player2Name = '';
  String player1SecretNumber = '';
  String player2SecretNumber = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setup Game')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Player 1 Name'),
                onChanged: (value) => player1Name = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Player 1 Secret Number'),
                onChanged: (value) => player1SecretNumber = value,
                validator: (value) {
                  if (value == null ||
                      value.length != 4 ||
                      !isUniqueDigits(value)) {
                    return 'Enter a unique 4-digit number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Player 2 Name'),
                onChanged: (value) => player2Name = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Player 2 Secret Number'),
                onChanged: (value) => player2SecretNumber = value,
                validator: (value) {
                  if (value == null ||
                      value.length != 4 ||
                      !isUniqueDigits(value)) {
                    return 'Enter a unique 4-digit number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GameScreen(
                          player1Name: player1Name,
                          player2Name: player2Name,
                          player1SecretNumber: player1SecretNumber,
                          player2SecretNumber: player2SecretNumber,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Start Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isUniqueDigits(String number) {
    return number.split('').toSet().length == number.length;
  }
}
