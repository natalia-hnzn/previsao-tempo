import 'package:flutter/material.dart';
import 'package:tempo/components/getApi.dart';

class Clima extends StatefulWidget {
  Future request;

  Clima({super.key, required this.request});

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: FutureBuilder(
        future: getApi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text('Tente novamente mais tarde'),
            );
          }

          final data = snapshot.data!;

          return Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['name'],
                    style: TextStyle(fontSize: 36),
                  ),
                  Text('${data['main']['temp']}°C',
                      style: TextStyle(fontSize: 60)),
                  Text(
                    '- ${data['main']['temp_min']}°C   + ${data['main']['temp_max']}°C',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    data['weather'][0]['description'],
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
