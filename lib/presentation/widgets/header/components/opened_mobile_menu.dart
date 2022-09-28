part of '../header.dart';

class _OpenedMobileMenu extends StatefulWidget {
  const _OpenedMobileMenu({Key? key}) : super(key: key);

  @override
  State<_OpenedMobileMenu> createState() => _OpenedMobileMenuState();
}

class _OpenedMobileMenuState extends State<_OpenedMobileMenu> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      if (context.screenWidth > 780) Navigator.pop(context);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              Header(isMenuOpened: true),
              SizedBox(height: 100),
              _OpenedMobileMenuContent(),
              SizedBox(height: 50),
              _AuthButton(),
              SizedBox(height: 50),
              LocaleDropdownMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
