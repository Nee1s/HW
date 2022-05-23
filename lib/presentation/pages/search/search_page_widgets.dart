import 'package:flutter/material.dart';

class FilterFields extends StatefulWidget {
  const FilterFields({Key? key}) : super(key: key);

  @override
  State<FilterFields> createState() => _FilterFieldsState();
}

class _FilterFieldsState extends State<FilterFields> {
  final TextEditingController searchTransfer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double _width = constraints.maxWidth;
        return const Text('');
      },
    );
  }

  @override
  void dispose() {
    searchTransfer.dispose();
    super.dispose();
  }
}
