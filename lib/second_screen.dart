part of 'main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen'), centerTitle: true),
      body: const Center(
          child: FlutterLogo(
        size: 300,
      )),
    );
  }
}
