import 'package:flutter/material.dart';
import 'package:shopping_application/model/cart_model.dart';
import 'package:shopping_application/views/home_page/controller.dart';

class QuantityInputWidget extends StatefulWidget {
  final cartItem item;
  final Controller cartController;

  const QuantityInputWidget(
      {Key? key, required this.item, required this.cartController})
      : super(key: key);

  @override
  _QuantityInputWidgetState createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  final TextEditingController _controller = TextEditingController();

  void _updateQuantity() {
    if (_controller.text.isEmpty) {
      return;
    }
    int newQuantity = int.tryParse(_controller.text) ?? 1;
    widget.cartController.changeGame(widget.item.game.id, newQuantity);
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.item.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Quantity'),
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => _updateQuantity(),
      ),
    );
  }
}
