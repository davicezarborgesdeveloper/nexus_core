import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';
import '../states/login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  final VoidCallback? onSuccess;
  final String title;

  const LoginPage({
    super.key,
    required this.controller,
    this.onSuccess,
    this.title = 'Login',
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.controller.submit(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder<LoginState>(
            valueListenable: widget.controller,
            builder: (context, state, _) {
              final isLoading = state is LoginLoading;

              if (state is LoginSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  widget.onSuccess?.call();
                });
              }

              if (state is LoginError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  widget.controller.reset();
                });
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Informe o e-mail';
                        }

                        final email = value.trim();
                        final isValid = RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        ).hasMatch(email);

                        if (!isValid) {
                          return 'Informe um e-mail válido';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _submit,
                        child: isLoading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Entrar'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
