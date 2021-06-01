import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';
import 'flutter_flow_theme.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String expression, answer;
  bool isDarkTheme = true;

  Color fullBodyColor = Color(0xFF22252E);
  Color keypadColorDark = Color(0xFF292D36);
  Color keypadColorLight = Color(0xFFE4E4E4);
  Color topColor = Color(0xFF00E676);
  Color topBackColor = Color(0xFF22252E);
  Color rightColor = Colors.red;
  Color rightBackColor = Color(0xFF22252E);
  Color numColor = Color(0xFFFAFAFA);
  Color numBackColor = Color(0xFF22252E);

  @override
  void initState() {
    expression = "0";
    answer = " ";
    super.initState();
  }

  void setVal(String val) {
    setState(() {
      if (val == "+" &&
          (expression[expression.length - 1] == "+" ||
              expression[expression.length - 1] == "-" ||
              expression[expression.length - 1] == "/" ||
              expression[expression.length - 1] == "*" ||
              expression[expression.length - 1] == "%")) {
        expression = expression;
      } else if (val == "-" &&
          (expression[expression.length - 1] == "+" ||
              expression[expression.length - 1] == "-" ||
              expression[expression.length - 1] == "/" ||
              expression[expression.length - 1] == "*" ||
              expression[expression.length - 1] == "%"))
        expression = expression;
      else if (val == "*" &&
          (expression[expression.length - 1] == "+" ||
              expression[expression.length - 1] == "-" ||
              expression[expression.length - 1] == "/" ||
              expression[expression.length - 1] == "*" ||
              expression[expression.length - 1] == "%"))
        expression = expression;
      else if (val == "/" &&
          (expression[expression.length - 1] == "+" ||
              expression[expression.length - 1] == "-" ||
              expression[expression.length - 1] == "/" ||
              expression[expression.length - 1] == "*" ||
              expression[expression.length - 1] == "%"))
        expression = expression;
      else if (val == "%" &&
          (expression[expression.length - 1] == "+" ||
              expression[expression.length - 1] == "-" ||
              expression[expression.length - 1] == "/" ||
              expression[expression.length - 1] == "*" ||
              expression[expression.length - 1] == "%"))
        expression = expression;
      else if (expression == "0") {
        if (val == "+" ||
            val == "-" ||
            val == "*" ||
            val == "/" ||
            val == "%") {
        } else {
          expression = val;
        }
      } else
        expression += val;
    });
  }

  void clear() {
    setState(() {
      expression = "0";
      answer = "";
    });
  }

  void clearAns() {
    setState(() {
      answer = "";
    });
  }

  void delete() {
    setState(() {
      expression = (expression.length > 1 && expression != "0")
          ? expression.substring(0, expression.length - 1)
          : "0";
    });
  }

  void calculate() {
    try {
      if (expression[expression.length - 1] != "+" ||
          expression[expression.length - 1] != "-" ||
          expression[expression.length - 1] != "/" ||
          expression[expression.length - 1] != "*" ||
          expression[expression.length - 1] != "%") {
        Parser p = new Parser();
        ContextModel cm = new ContextModel();
        Expression exp = p.parse(expression);
        setState(() {
          var a = exp.evaluate(EvaluationType.REAL, cm).toString();
          if (a.endsWith(".0")) {
            answer = a.substring(0, a.length - 2);
          } else {
            answer = a;
          }
        });
      }
    } catch (e) {
      setState(() {
        answer = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: isDarkTheme ? Color(0xFF22252E) : Colors.white,
      appBar: AppBar(
        title: Container(
          width: 120,
          height: 60,
          decoration: BoxDecoration(
            color: isDarkTheme ? Color(0xFF292D36) : keypadColorLight,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: isDarkTheme ? keypadColorDark : keypadColorLight,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => setState(() => isDarkTheme = false),
                  child: Icon(
                    Icons.wb_sunny_outlined,
                    color: isDarkTheme ? keypadColorLight : Colors.orange,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Material(
                color: isDarkTheme ? keypadColorDark : keypadColorLight,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => setState(() => isDarkTheme = true),
                  child: FaIcon(
                    FontAwesomeIcons.moon,
                    color: isDarkTheme ? Colors.orange : numColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: isDarkTheme ? Color(0xFF22252E) : Colors.white,
      ),
      body: Align(
        alignment: Alignment(-1, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Expressions
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 4),
              child: Text(
                expression,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: isDarkTheme ? numColor : numBackColor,
                  fontSize: 24,
                ),
              ),
            ),
            // Answers
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 23),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  answer,
                  textAlign: TextAlign.end,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: isDarkTheme ? numColor : numBackColor,
                    fontSize: 52,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            //Buttons
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: isDarkTheme ? keypadColorDark : keypadColorLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                shape: BoxShape.rectangle,
              ),
              alignment: Alignment(0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(color: Color(0x00EEEEEE)),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalcButton(
                            buttonText: "AC",
                            color: isDarkTheme ? topColor : topBackColor,
                            backgroundColor:
                                isDarkTheme ? topBackColor : topColor,
                            onTap: () => clear(),
                          ),
                          CalcIconButton(
                            iconData: Icons.backspace_outlined,
                            color: isDarkTheme ? topColor : topBackColor,
                            backgroundColor:
                                isDarkTheme ? topBackColor : topColor,
                            onTap: () => delete(),
                            size: 30,
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.percentage,
                            color: isDarkTheme ? topColor : topBackColor,
                            backgroundColor:
                                isDarkTheme ? topBackColor : topColor,
                            onTap: () => setVal("%"),
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.divide,
                            color: isDarkTheme ? rightColor : rightBackColor,
                            backgroundColor:
                                isDarkTheme ? rightBackColor : rightColor,
                            onTap: () => setVal("/"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalcButton(
                            buttonText: "7",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("7"),
                          ),
                          CalcButton(
                            buttonText: "8",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("8"),
                          ),
                          CalcButton(
                            buttonText: "9",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("9"),
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.times,
                            color: isDarkTheme ? rightColor : rightBackColor,
                            backgroundColor:
                                isDarkTheme ? rightBackColor : rightColor,
                            onTap: () => setVal("*"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalcButton(
                            buttonText: "4",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("4"),
                          ),
                          CalcButton(
                            buttonText: "5",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("5"),
                          ),
                          CalcButton(
                            buttonText: "6",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("6"),
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.minus,
                            color: isDarkTheme ? rightColor : rightBackColor,
                            backgroundColor:
                                isDarkTheme ? rightBackColor : rightColor,
                            onTap: () => setVal("-"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalcButton(
                            buttonText: "1",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("1"),
                          ),
                          CalcButton(
                            buttonText: "2",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("2"),
                          ),
                          CalcButton(
                            buttonText: "3",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("3"),
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.plus,
                            color: isDarkTheme ? rightColor : rightBackColor,
                            backgroundColor:
                                isDarkTheme ? rightBackColor : rightColor,
                            onTap: () => setVal("+"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CalcIconButton(
                            iconData: Icons.refresh_outlined,
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            size: 30,
                            onTap: () => clearAns(),
                          ),
                          CalcButton(
                            buttonText: "0",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            onTap: () => setVal("0"),
                          ),
                          CalcButton(
                            buttonText: ".",
                            color: isDarkTheme ? numColor : numBackColor,
                            backgroundColor:
                                isDarkTheme ? numBackColor : numColor,
                            fontWeight: FontWeight.w900,
                            onTap: () => setVal("."),
                          ),
                          CalcIconButton(
                            iconData: FontAwesomeIcons.equals,
                            color: isDarkTheme ? rightColor : rightBackColor,
                            backgroundColor:
                                isDarkTheme ? rightBackColor : rightColor,
                            onTap: () => calculate(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
