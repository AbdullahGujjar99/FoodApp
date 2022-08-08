import 'package:flutter/material.dart';
import 'demoData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Delievery To'.toUpperCase(), style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16
                ),),
                Text('San Francisco', style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),

              ],
            ),
            actions: [
              TextButton(onPressed: (){

              }, child: Text('Filter', style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),),)
            ],
          ),
          SliverToBoxAdapter(
            child: ImageCrusel(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Feature Partner', style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  TextButton(onPressed: (){

                  }, child: Text('SeeAll', style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                  ),),)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(demoMediamCardData.length, (index) => Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    onTap: (){

                    },
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1.25,
                            child: Image.asset(demoMediamCardData[index]['image']),
                          ),
                          Text(demoMediamCardData[index]['name'], style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),),
                          Text(demoMediamCardData[index]['location'], style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: Text(demoMediamCardData[index]['rate'].toString(), style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                              Spacer(),
                              Text('${demoMediamCardData[index]['deliverytime'].toString()} min', style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                              ),
                              Spacer(),
                              Text('Free Delievery', style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),)
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('image', style: const TextStyle(
          //         color: Colors.black,
          //         fontSize: 13,
          //       ),),
          //       TextButton(onPressed: (){
          //
          //       }, child: Text('SeeAll', style: const TextStyle(
          //         color: Colors.blue,
          //         fontSize: 13,
          //       ),),)
          //     ],
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Image.asset('images/baner.png')
          ),
        ],
      ),
    );
  }
}

class ImageCrusel extends StatefulWidget {
  const ImageCrusel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCrusel> createState() => _ImageCruselState();
}

class _ImageCruselState extends State<ImageCrusel> {
  int _CurrentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.8,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView.builder(itemCount: demoBigimages.length,
          onPageChanged: (value){
            setState(() {
              _CurrentPage = value;
            });
          },
          itemBuilder: (context , index)=>Image.asset(demoBigimages[index]),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              children: List.generate(demoBigimages.length, (index) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IndicatorDot(isActive: index == _CurrentPage,),
              ),),
            )
          ),
        ],
      ),

    );
  }
}

class IndicatorDot extends StatelessWidget {
  IndicatorDot({
    Key? key, required this.isActive
  }) : super(key: key);
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive? Colors.grey : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),

      ),
    );
  }
}

