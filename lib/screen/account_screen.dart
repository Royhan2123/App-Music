import 'package:application_music/bloc/auth_bloc/auth_bloc.dart';
import 'package:application_music/login_screen.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          header(),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Profile",
          style: txtBlack.copyWith(
            fontSize: 17,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            "Edit",
            style: txtBlack,
          ),
          icon: const Icon(
            Icons.edit,
            size: 20,
            color: Colors.black,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade400,
            minimumSize: const Size(
              100,
              45,
            ),
          ),
        ),
      ],
    );
  }

  Widget logout() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(
              200,
              40,
            ),
          ),
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthLogout(),
                );
          },
          child: const Text(
            "Log out",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
