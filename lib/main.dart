import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart'; // to use Emoji utilities
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de divisas',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'CONVERSOR DE DIVISAS'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final icono;
  final color;

  calculadora(this.titulo, this.icono, this.color);
}

//Declaración variales input KeyPad
final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "USD";
String op2 = "COP";

List<DropdownMenuItem<String>> moneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(
      value: "USD",
      child: Text(
          style: GoogleFonts.raleway(fontWeight: FontWeight.w400, fontSize: 16),
          "${Emojis.flagUnitedStates} USD")),
  DropdownMenuItem(
      value: "EUR",
      child: Text(
        style: GoogleFonts.raleway(fontWeight: FontWeight.w400, fontSize: 16),
        "${Emojis.flagEuropeanUnion} EUR",
      )),
  DropdownMenuItem(
    value: "COP",
    child: Text(
      style: GoogleFonts.raleway(fontWeight: FontWeight.w400, fontSize: 16),
      "${Emojis.flagColombia} COP",
    ),
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<calculadora> lc = <calculadora>[
    calculadora("9", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("8", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("7", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("6", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("5", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("4", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("3", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("2", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("1", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora("0", Icon(Icons.person), Color.fromARGB(255, 130, 213, 252)),
    calculadora(
        "Limpiar",
        Icon(Icons.cleaning_services_rounded,
            color: Color.fromARGB(255, 85, 3, 3)),
        Color.fromARGB(255, 250, 74, 74)),
    calculadora(
        "Calcular",
        Icon(Icons.calculate_rounded, color: Color.fromARGB(255, 6, 92, 25)),
        Color.fromARGB(255, 67, 218, 62)),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: GoogleFonts.bebasNeue(
                fontSize: 35, fontWeight: FontWeight.w500, letterSpacing: 5),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      "Origen : "),
                  DropdownButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      borderRadius: BorderRadius.circular(10),
                      value: op1,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          op1 = X.toString();
                        });
                      }),
                  Text(
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      "Destino : "),
                  DropdownButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      borderRadius: BorderRadius.circular(10),
                      value: op2,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          op2 = X.toString();
                        });
                      }),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Moneda Origen",
                    hintText: '0',
                    icon: Icon(Icons.monetization_on_outlined)),
                controller: textOrigen,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Moneda Destino",
                    hintText: '0',
                    icon: Icon(Icons.monetization_on_outlined)),
                controller: textDestino,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: (2 / 1),
                    ),
                    itemCount: lc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        elevation: 5,
                        color: lc[index].color,
                        child: ListTile(
                          title: Center(
                            child: index > 9
                                ? lc[index].icono
                                : Text(lc[index].titulo,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                          ),
                          onTap: () {
                            if (index == 10) {
                              textOrigen.text = "";
                              textDestino.text = "";
                            } else if (index < 10) {
                              textOrigen.text =
                                  textOrigen.text + lc[index].titulo;
                            } else {
                              if (op1 == "USD" && op2 == "COP") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) * 3829)
                                        .toString();
                              } else if (op1 == "COP" && op2 == "USD") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) / 3829)
                                        .toString();
                              } else if (op1 == "EUR" && op2 == "COP") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) * 4080)
                                        .toString();
                              } else if (op1 == "COP" && op2 == "EUR") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) / 4080)
                                        .toString();
                              } else if (op1 == "USD" && op2 == "EUR") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) * 0.99)
                                        .toString();
                              } else if (op1 == "EUR" && op2 == "USD") {
                                textDestino.text =
                                    (double.parse(textOrigen.text) / 0.99)
                                        .toString();
                              } else {
                                textDestino.text = textOrigen.text;
                              }
                            }
                            print(
                                lc[index].titulo); //probar el onTap en consola
                          },
                        ),
                      );
                    }),
              ),
              Text(
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromARGB(255, 151, 150, 150)),
                'EQUIPO 3\nYuly Andrea Castro Torres\nAlexander Anillo Trocha\nDaniel Esteban Agudelo Duque\nHeyder Barbosa Oreego\nLina Rocio Cardenas Fernandez',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }
}
