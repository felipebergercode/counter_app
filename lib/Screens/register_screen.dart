import 'package:counter_app/cubits/cubit/cubit/username_cubit.dart';
import 'package:counter_app/cubits/cubit/register_cubit.dart';
import 'package:counter_app/widgets/containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.status == RegisterStatus.success) {
                context.push('/cubits');
              } else if (state.status == RegisterStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message ?? 'Error')),
                );
              }
            },
            child: Center(
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Register screen',
                    style: TextStyle(
                      height: 0,
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(height: 25),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Containers(
                        prefIcon: const Icon(Icons.email),
                        hText: 'Enter your email',
                        containerColor: Colors.grey.shade200,
                        theValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El campo es obligatorio';
                          }

                          if (!value.contains('@')) {
                            return 'Debe ser un email válido';
                          }

                          return null;
                        },
                        onChanged: context.read<RegisterCubit>().emailChanged,
                        errorText: state.emailError,
                      );
                    },
                  ),
                  BlocBuilder<UsernameCubit, UsernameState>(
                    builder: (context, ustate) {
                      return Containers(
                        prefIcon: const Icon(Icons.verified_user),
                        hText: 'Your name',
                        containerColor: Colors.green.shade300,
                        onChanged: context
                            .read<UsernameCubit>()
                            .usernameChanged,
                      );
                    },
                  ),
                  SizedBox(height: 60),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.status == RegisterStatus.loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final name = context
                                      .read<UsernameCubit>()
                                      .state
                                      .username;
                                  final email = context
                                      .read<RegisterCubit>()
                                      .state
                                      .email;
                                  context.read<RegisterCubit>().login(
                                    name: name,
                                    email: email,
                                    password: '123456',
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('El camppo es obligatorio'),
                                    ),
                                  );
                                }
                              },
                        child: state.status == RegisterStatus.loading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Next page'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
