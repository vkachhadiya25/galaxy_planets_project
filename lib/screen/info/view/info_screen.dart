import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  HomeProvider? providerr;
  HomeProvider? providerw;
  late AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    HomeModel g1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${g1.name}"),
          centerTitle: true,
          actions: [
            // Icon(Icons.bookmark),
            IconButton(
                onPressed: () {
                  providerr!.getBookMark();
                  if (!providerr!.planetListDetail!.contains(
                      providerr!.planetList![providerw!.index!].name!)) {
                    providerr!.addBookMark();
                  } else {
                    providerr!.removeBookMark();
                  }
                },
              icon: Icon(Icons.add),
                // icon: providerw!.planetListDetail!.contains(
                //         providerw!.planetList![providerw!.index!].name!)
                //     ? const Icon(Icons.favorite)
                //     : const Icon(Icons.favorite_outline_rounded),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/image/images.jpeg",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: animationController!.value,
                              child: Image.asset(
                                "${g1.image}",
                                height: 200,
                                width: 200,
                              )),
                          Column(
                            children: [
                              Text(
                                "${g1.name}",
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${g1.title}",
                                style: const TextStyle(fontSize: 17,color: Colors.white),
                              ),
                              const SizedBox(height: 15),
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Details pf planet :",
                                    style: TextStyle(fontSize: 20,color: Colors.white),
                                  )),
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: providerr!.islight
                                            ? Colors.black
                                            : Colors.white)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Day = ${g1.day} hr",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                    Text(
                                      "Orbits = ${g1.orbit} Km/sec",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                    Text(
                                      "No of moons = ${g1.moons} Moon",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: providerr!.islight
                                            ? Colors.black
                                            : Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Year : ${g1.year}",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                    Text(
                                      "planets eliplcity : ${g1.ecliptic}",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                    Text(
                                      "planet velocity : ${g1.velocity}",
                                      style: const TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
