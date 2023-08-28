import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_api/src/widgets/pokemon_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          centerTitle: true,
          elevation: 18.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.h),
                bottomRight: Radius.circular(50.h)),
          ),
          title: Center(
            child: Image.network(
              'https://fontmeme.com/permalink/220412/fdf5cd11d3af18a8ef6b9fbeb8d98a65.png',
              height: 50.h,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(child: MenuAppBar()),
          ],
        ),
      ),
    );
  }
}
