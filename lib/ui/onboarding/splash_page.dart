import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/cubits/splash/splash_cubit.dart';
import '../../widgets/app_background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<SplashCubit>();
    cubit.loadInitialScreens();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    cubit.startAnimation();
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      cubit.triggerNavigation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.navigateNext) {
          context.go('/welcome');
        }
      },
      child: Scaffold(
        body: AppBackground(
          child: Center(
            child: FadeTransition(
              opacity: _fade,
              child: Image.asset("assets/images/logo.png", height: 200),
            ),
          ),
        ),
      ),
    );
  }
}
