import 'package:flutter/material.dart';

void main() {
  runApp(NameBar());
}

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progres Bar',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create a tween for double type
  var tween = Tween<double>(begin: 0.0, end: 1.0);
  double targetProgress = 1.0;

  @override
  Widget build(BuildContext context) {
    //create media Query value
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Color(0xFF090C10),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //outer conatainer
            Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0x40FFFFFF), Color(0x00FFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

              //inner container
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                width: width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFF12161B),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 15,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),

                //tween Animation
                child: TweenAnimationBuilder(
                  tween: tween,
                  duration: Duration(seconds: 40),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    //inner content
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress ${(value * 100).toInt()} %',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0.5,
                                fontWeight: .bold,
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF1F2630),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.cancel,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final totalWidth = constraints.maxWidth;
                            final currentWidth = totalWidth * value;

                            return Container(
                              height: 14,
                              width: totalWidth,
                              decoration: BoxDecoration(
                                color: Color(0xFF151B22),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 50),
                                    width: currentWidth,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF44EBBA),
                                          Color(0xFF66FCD2),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
