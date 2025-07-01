import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:ecommerce_web/presentation/bloc/auth/bloc/authentication_bloc.dart';
import 'package:ecommerce_web/presentation/widget/global_appbar.dart';
import 'package:ecommerce_web/presentation/widget/global_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericPage extends StatefulWidget {
  final Widget child;
  const GenericPage({super.key, required this.child});

  @override
  State<GenericPage> createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 1.4),
              child: BlocBuilder(builder: (ctx, state) {
                UserInfo? user;

                if (authState is AuthenticatedState) {
                  user = authState.user;
                }

                return GlobalAppBar(context: ctx, user: user);
              })),
          body: Column(
            children: [Expanded(child: widget.child), const GlobalFooter()],
          ),
        );
      },
    );
  }
}
