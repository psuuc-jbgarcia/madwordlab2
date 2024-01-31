import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:gap/gap.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen({super.key, this.index});

  int? index;

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context, listen: false);
    if (widget.index != null) {
      //get the item
      var product = provider.item(widget.index!);
      codeController.text = product.productCode;
      nameController.text = product.nameDesc;
      priceController.text = product.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? 'Add Product' : 'Edit Product'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            TextField(
              controller: codeController,
              readOnly: widget.index != null,
              decoration: InputDecoration(
                label: const Text('Product Code'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text('Name/Desc'),
                border: OutlineInputBorder(),
              ),
            ),
            // Gap(12),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {
                var p = Product(
                  productCode: codeController.text,
                  nameDesc: nameController.text,
                  price: double.parse(priceController.text),
                );
                if (widget.index == null) {
                  provider.add(p);
                } else {
                  provider.edit(p, widget.index!);
                }
                Navigator.of(context).pop();
              },
              child: Text(widget.index == null ? 'ADD' : 'EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
