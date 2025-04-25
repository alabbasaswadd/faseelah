import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flame_test_app/core/constants/images.dart';
import 'package:flame_test_app/ui/components/dialog_component.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DialogComponent(),
          Positioned(
            top: 250,
            left: 57,
            child: customBox(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customLabel(text: "A1", width: 64),
                    customText(text: "المستوى", fontSize: 24),
                  ],
                ),
                Spacer(),
                customLabel(text: "1/10", width: double.infinity)
              ],
            )),
          ),
          Positioned(
            top: 380,
            left: 57,
            child: customBox(
                child: Column(
              children: [
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(text: "نقاط السؤال", fontSize: 16),
                      customText(text: "المهارة", fontSize: 16),
                      customText(text: "عدد الأسئلة", fontSize: 16),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customImage(text: "48", fontSize: 25),
                    customImage(text: "قراءة", fontSize: 18),
                    customImage(text: "8", fontSize: 30),
                  ],
                )
              ],
            )),
          ),
          Positioned(
            top: 200,
            right: 50,
            child: Image.asset(AppImage.mistake2),
          ),
          Positioned(
              left: 115, bottom: 105, child: Image.asset(AppImage.startButton)),
          Positioned(left: 60, top: 120, child: Image.asset(AppImage.level)),
          Positioned(bottom: 10, left: 0, child: endContainer()),
          Positioned(bottom: 10, left: 75, child: endContainer()),
          Positioned(bottom: 10, left: 150, child: endContainer()),
          Positioned(bottom: 10, left: 225, child: endContainer()),
          Positioned(bottom: 10, left: 330, child: endContainer()),
          Positioned(bottom: 0, right: 89, child: finishContainer()),
        ],
      ),
    );
  }
}

Widget customBox({required Widget child}) {
  return Container(
    padding: EdgeInsets.all(10),
    width: 298,
    height: 110,
    decoration: BoxDecoration(
        color: Color(0xffaed6c1), borderRadius: BorderRadius.circular(10)),
    child: child,
  );
}

Widget customLabel(
    {required String text,
    required double width,
    double? fontSize = 25,
    Color? color = AppColor.kThirtColor,
    double? height = 28}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: AppColor.kPrimaryColor,
        boxShadow: [
          BoxShadow(
              color: AppColor.kfivedColor, offset: Offset(0, 2), blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 3)),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: "Tajawal",
            fontWeight: FontWeight.w900),
      ),
    ),
  );
}

Widget customText(
    {required String text,
    required double fontSize,
    Color? color = AppColor.kPrimaryColor}) {
  return Stack(
    children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: "Tajawal",
          fontSize: fontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = fontSize / 7
            ..color = Colors.white,
        ),
      ),
      Text(
        text,
        style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w900),
      ),
    ],
  );
}

Widget customImage({required String text, required double fontSize}) {
  return Container(
    width: 63,
    height: 64,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImage.bubble4))),
    child: Center(child: customText(text: text, fontSize: fontSize)),
  );
}

Widget endContainer() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          17,
          (i) => Container(
            width: 4.3,
            height: 85,
            decoration: BoxDecoration(
              color:
                  i.isEven ? AppColor.kGreenYellowColor : AppColor.kGreenColor,
            ),
          ),
        ),
      ),
      Positioned(
        top: 15,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.kGreenYellowColor, width: 4),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.green.withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              AppImage.charectar,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(height: 15),
      Positioned(
          bottom: 22,
          child: customText(text: "Name", fontSize: 10, color: Colors.black)),
      Positioned(
          bottom: 5,
          child: customLabel(
              text: "8/10",
              width: 41,
              height: 16,
              fontSize: 10,
              color: Colors.yellow)),
      Positioned(
        top: -8,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.brown,
            border: Border.all(color: Colors.orangeAccent, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.3),
                offset: Offset(0, 3),
                blurRadius: 4,
              )
            ],
          ),
          child: Center(
            child: customText(text: "1", fontSize: 12, color: Colors.white),
          ),
        ),
      ),
      Positioned.fill(
        child: IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.center,
                colors: [
                  Colors.yellowAccent.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget finishContainer() {
  return SizedBox(
    height: 120,
    width: 16,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: 24,
      itemBuilder: (context, index) {
        int row = index ~/ 2;
        int col = index % 2;
        bool isWhite = (row + col) % 2 == 0;
        return Container(
          color: isWhite ? Colors.white : Colors.black,
        );
      },
      physics: NeverScrollableScrollPhysics(),
    ),
  );
}
