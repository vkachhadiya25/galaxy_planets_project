import 'dart:math';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:galaxy_planets/utils/share_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeProvider? providerr;
  HomeProvider? providerw;
  AnimationController? animationController;
  Animation? rotation;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().planetJson();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    rotation = Tween<double>(begin: 10, end: 10).animate(animationController!);
    animationController!.repeat();
    // animationController!.addListener(() {
    //   setState(() {});
    // });
    context.read<HomeProvider>().getBookMark();
  }

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: const Text(
            "planet",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          actions: [
            const Icon((Icons.settings)),
            Consumer<HomeProvider>(
              builder: (context, value1, child) => Switch(
                value: providerr!.islight,
                onChanged: (value) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value);
                  providerr!.changeTheme();
                },
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: providerw!.planetListDetail!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  providerr!.planetListDetail![index],
                  style: const TextStyle(fontSize: 20),
                ),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/image/images.jpeg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
            GridView.builder(
              itemCount: providerw!.planetList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 100),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 75),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${providerw!.planetList[index].name}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Transform.rotate(
                            angle: pi * animationController!.value * 2,
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, 'info',arguments: providerw!.planetList![index]);
                              },
                              child: Image.asset(
                                "${providerw!.planetList[index].image}",
                                height: 180,
                                width: 180,
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
