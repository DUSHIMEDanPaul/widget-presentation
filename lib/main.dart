import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetPresentationApp());
}

class WidgetPresentationApp extends StatelessWidget {
  const WidgetPresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FittedBox & FractionallySizedBox Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  double _fractionWidth = 0.7;
  double _fractionHeight = 0.4;
  BoxFit _boxFit = BoxFit.contain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FittedBox vs FractionallySizedBox'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'FittedBox'),
              Tab(text: 'FractionallySizedBox'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FittedBox scales and positions its child within itself.',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<BoxFit>(
                    value: _boxFit,
                    decoration: const InputDecoration(
                      labelText: 'BoxFit mode',
                      border: OutlineInputBorder(),
                    ),
                    items: BoxFit.values
                        .map(
                          (fit) => DropdownMenuItem(
                            value: fit,
                            child: Text(fit.name),
                          ),
                        )
                        .toList(),
                    onChanged: (fit) {
                      if (fit != null) {
                        setState(() => _boxFit = fit);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 280,
                        height: 160,
                        color: Colors.teal.shade50,
                        padding: const EdgeInsets.all(8),
                        child: FittedBox(
                          fit: _boxFit,
                          alignment: Alignment.center,
                          child: Container(
                            width: 420,
                            height: 80,
                            color: Colors.teal,
                            alignment: Alignment.center,
                            child: const Text(
                              'Very Wide Child Widget',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Tip: Try cover, contain, fitWidth, and none to explain behavior.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FractionallySizedBox sizes child as a fraction of parent size.',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _LabeledSlider(
                    label: 'Width factor: ${_fractionWidth.toStringAsFixed(2)}',
                    value: _fractionWidth,
                    onChanged: (v) => setState(() => _fractionWidth = v),
                  ),
                  _LabeledSlider(
                    label: 'Height factor: ${_fractionHeight.toStringAsFixed(2)}',
                    value: _fractionHeight,
                    onChanged: (v) => setState(() => _fractionHeight = v),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 220,
                        color: Colors.orange.shade50,
                        child: FractionallySizedBox(
                          widthFactor: _fractionWidth,
                          heightFactor: _fractionHeight,
                          alignment: Alignment.center,
                          child: Container(
                            color: Colors.orange,
                            alignment: Alignment.center,
                            child: Text(
                              '${(_fractionWidth * 100).round()}% x '
                              '${(_fractionHeight * 100).round()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Tip: Perfect for responsive blocks like cards, banners, and overlays.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledSlider extends StatelessWidget {
  const _LabeledSlider({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          min: 0.1,
          max: 1.0,
          divisions: 18,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
