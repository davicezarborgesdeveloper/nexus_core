import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';
import '../login_theme.dart';
import '../states/login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  final VoidCallback? onSuccess;
  final String title;
  final LoginTheme? loginTheme;

  const LoginPage({
    super.key,
    required this.controller,
    this.onSuccess,
    this.title = 'Login',
    this.loginTheme,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _obscurePassword = ValueNotifier<bool>(true);
  final _rememberMe = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    _rememberMe.dispose();
    super.dispose();
  }

  bool get _isMobileDevice =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.controller.submit(
      email: _emailController.text,
      password: _passwordController.text,
      rememberMe: _rememberMe.value,
    );
  }

  InputDecoration _fieldDecoration({
    required String hint,
    required bool isMobile,
    required Color primaryColor,
    required String bodyFont,
  }) {
    if (isMobile) {
      return InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        hintStyle: TextStyle(
          color: const Color(0xFF0F172A).withValues(alpha: 0.4),
          fontSize: 14,
          fontFamily: bodyFont,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      );
    }

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: const Color(0xFF0F172A).withValues(alpha: 0.5),
        fontSize: 14,
        fontFamily: bodyFont,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = _isMobileDevice;
    final lTheme = widget.loginTheme;

    final primaryColor =
        lTheme?.primaryColor ?? Theme.of(context).colorScheme.primary;
    final bgColor = lTheme?.backgroundColor ?? Colors.white;
    final titleFont = lTheme?.titleFontFamily ?? 'Space Grotesk';
    final bodyFont = lTheme?.bodyFontFamily ?? 'Inter';

    return Scaffold(
      backgroundColor: bgColor,
      appBar: isMobile
          ? AppBar(
              backgroundColor: bgColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFe2e8f0),
                ),
              ),
              title: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kIsWeb ? 24 : 16,
                ),
                width: MediaQuery.of(context).size.width < 1200 ? null : 1200,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: Color(0xFF475569),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Voltar ao portfólio',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF475569),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Container(
        decoration: lTheme?.backgroundImage != null
            ? BoxDecoration(
                color: bgColor,
                image: lTheme!.backgroundImage,
              )
            : null,
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.message)),
                );
                widget.controller.reset();
              });
            }

            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: isMobile ? double.infinity : 448,
                          padding: const EdgeInsets.all(32),
                          decoration: isMobile
                              ? null
                              : BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFFE2E8F0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.08,
                                      ),
                                      spreadRadius: -10,
                                      blurRadius: 60,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Logo: customizável ou padrão
                                lTheme?.logo ??
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Icon(
                                        Icons.settings_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                const SizedBox(height: 16),
                                Text(
                                  'Área Administrativa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: const Color(0xFF0F172A),
                                    fontFamily: titleFont,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Faça login, para acessar o painel',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xFF64748B),
                                    fontFamily: bodyFont,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'E-mail',
                                      style: TextStyle(
                                        fontFamily: bodyFont,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: const Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      enabled: !isLoading,
                                      decoration: _fieldDecoration(
                                        hint: 'Digite seu e-mail',
                                        isMobile: isMobile,
                                        primaryColor: primaryColor,
                                        bodyFont: bodyFont,
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Informe o e-mail';
                                        }
                                        final isValid = RegExp(
                                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                        ).hasMatch(value.trim());
                                        if (!isValid) {
                                          return 'Informe um e-mail válido';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Senha',
                                      style: TextStyle(
                                        fontFamily: bodyFont,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: const Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    ValueListenableBuilder<bool>(
                                      valueListenable: _obscurePassword,
                                      builder: (context, obscure, _) =>
                                          TextFormField(
                                        controller: _passwordController,
                                        obscureText: obscure,
                                        enabled: !isLoading,
                                        decoration: _fieldDecoration(
                                          hint: 'Digite sua senha',
                                          isMobile: isMobile,
                                          primaryColor: primaryColor,
                                          bodyFont: bodyFont,
                                        ).copyWith(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              obscure
                                                  ? Icons.visibility_outlined
                                                  : Icons.visibility_off_outlined,
                                              color: const Color(0xFF94A3B8),
                                              size: 20,
                                            ),
                                            onPressed: () => _obscurePassword
                                                .value = !obscure,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Informe a senha';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                ValueListenableBuilder<bool>(
                                  valueListenable: _rememberMe,
                                  builder: (context, rememberMe, _) =>
                                      CheckboxListTile(
                                    value: rememberMe,
                                    activeColor: primaryColor,
                                    onChanged: isLoading
                                        ? null
                                        : (v) =>
                                            _rememberMe.value = v ?? false,
                                    title: Text(
                                      'Lembrar-me',
                                      style: TextStyle(fontFamily: bodyFont),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: isLoading ? null : _submit,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: isLoading
                                        ? const SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            'Entrar',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: bodyFont,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Acesso restrito ao administrador do portfólio',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF94A3B8),
                            fontFamily: bodyFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
