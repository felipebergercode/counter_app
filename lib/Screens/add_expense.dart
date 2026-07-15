import 'package:counter_app/styles/colors.dart';
import 'package:counter_app/widgets/container_button.dart';
import 'package:counter_app/widgets/selector_de_categorias.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:counter_app/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TipoMovimiento { gasto, ingreso }

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  String? _selectedCategory;
  TipoMovimiento movimientoSeleccionado = TipoMovimiento.gasto;
  bool _esGasto = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.backgroundColor,
          title: Text(
            'Nuevo gasto',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: appColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        movimientoSeleccionado = TipoMovimiento.gasto;
                        _esGasto = true;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                        color: _esGasto
                            ? appColors.primaryColor
                            : const Color(0xFFCDCBCB),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Gasto',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _esGasto ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        movimientoSeleccionado = TipoMovimiento.ingreso;
                        _esGasto = false;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                        color: _esGasto
                            ? const Color(0xFFCDCBCB)
                            : appColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Ingreso',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _esGasto ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Monto',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(2, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: appColors.containerGastoIngresoBackground,
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: _amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un monto';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.attach_money, size: 30),
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Categoria',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              SelectorDeCategorias(
                onChanged: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
              SizedBox(height: 40),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Nota (opcional)',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appColors.containerGastoIngresoBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escribe una nota ...',
                  ),
                ),
              ),
              SizedBox(height: 200),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.push('/homescreen');
                  }
                },
                child: ContainerButton(text: 'Guardar gasto'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveTransaction() {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Seleccioná una categoría')));

      return;
    }
    final double? amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      return;
    }
  }
}
