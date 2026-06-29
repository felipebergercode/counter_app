import 'package:counter_app/styles/colors.dart';
import 'package:counter_app/widgets/container_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: appColors.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 32,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Money',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'Flow',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: appColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Controla tu dinero \n Toma mejores decisiones',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 350),
              child: Text(
                'Email',

                style: TextStyle(fontFamily: 'Inter', fontSize: 18),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: appColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 191, 190, 190),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ejemplo@email.com',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text(
                'Contraseña',

                style: TextStyle(fontFamily: 'Inter', fontSize: 18),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: appColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 191, 190, 190),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Olvdiaste tu contraseña?',
                  style: TextStyle(color: appColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 40),
            ContainerButton(text: 'Iniciar Sesion'),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'No tienes cuenta ? Inicia sesion',
                style: TextStyle(
                  color: appColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
