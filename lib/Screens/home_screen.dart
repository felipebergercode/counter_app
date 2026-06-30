import 'package:counter_app/cubit/balance/balance_cubit.dart';
import 'package:counter_app/cubit/userName/user_name_cubit.dart';
import 'package:counter_app/styles/colors.dart';
import 'package:counter_app/widgets/ingresos_perdidas_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserNameCubit, UserNameState>(
              builder: (context, state) {
                return Text(
                  'Hola, ${state.name} 👋',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                );
              },
            ),
            Text(
              'Este es tu resumen del mes',
              style: TextStyle(color: const Color(0xFF646363), fontSize: 15),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFD0D0D0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance disponible',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final cubit = context.read<BalanceCubit>();
                            final controller = TextEditingController();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: Text('Editar balance'),
                                content: TextField(
                                  controller: controller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Ingresá el nuevo balance',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext),
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final value = int.tryParse(
                                        controller.text,
                                      );
                                      if (value != null) {
                                        cubit.newBalance(value);
                                      }
                                      Navigator.pop(dialogContext);
                                    },
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    BlocBuilder<BalanceCubit, BalanceState>(
                      builder: (context, state) {
                        return Text(
                          '\$${state.balance}',
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.w800,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IngresosPerdidasContainer(
                  text: 'Ingresos',
                  color: const Color(0xFF65C468),
                  text2: '\$50.000',
                  color2: const Color(0xFF1C8C20),
                ),
                IngresosPerdidasContainer(
                  text: 'Gastos',
                  color: const Color.fromARGB(255, 181, 105, 105),
                  text2: '\$15.000',
                  color2: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
