import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      home: ColorPicker(),
    );
  }
}

class ColorPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  List<Color> colorPalette = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    colorPalette.clear();
    // white to black
    for (int i = 0; i < 12; i++)
      colorPalette
          .add(HSVColor.fromAHSV(1.0, 0.0, 0.0, 1 - (i * 0.08)).toColor());
    // Hue
    for (double j = 0; j < 0.9; j = j + 0.1) {
      // Saturation
      for (int i = 0; i < 12; i++) {
        colorPalette.add(
            HSVColor.fromAHSV(1.0, (360 - (i * 30) % 360), 1 - j, 1.0)
                .toColor());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.none,
              width: 240,
              height: 220,
              color: Colors.green,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 20,
                  maxCrossAxisExtent: 20,
                  childAspectRatio: 1,
                ),
                itemCount: colorPalette.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                        color: colorPalette[index],
                      ),
                      child: index == selectedIndex
                          ? Icon(
                              Icons.circle_outlined,
                              size: 20,
                              color: Color.fromRGBO(
                                  255 - colorPalette[index].red,
                                  255 - colorPalette[index].green,
                                  255 - colorPalette[index].blue,
                                  1.0),
                            )
                          : Center(),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 240,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: colorPalette[selectedIndex],
              ),
              child: Center(
                  child: Text(
                colorPalette[selectedIndex].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
