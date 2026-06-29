import 'package:counter_app/styles/colors.dart';
import 'package:counter_app/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _hasText = _nameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Antes de empezar necesitamos saber tu nombre',
                style: TextStyle(
                  height: 1.1,
                  fontFamily: 'Inter',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: appColors.primaryColor,
                ),
              ),
              SizedBox(height: 40),
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
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },

                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 50),
              if (_hasText)
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.push('/homescreen');
                    }
                  },
                  child: ContainerButton(text: 'Listo para empezar'),
                ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
