import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LeaderboardGame extends FlameGame {
  final List<Map<String, dynamic>> players;

  LeaderboardGame(this.players);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // الخلفية
    add(RoundedShadowCard(
        shadowColor: Color(0xFF3e0094),
        radius: 30,
        sizes: Vector2(420, 580),
        backgroundColor: Color(0xFF6026d4)
        // paint: Paint()..color = const Color(0xFF3B0CA8),
        ));
    add(RoundedShadowCard(
        position: Vector2(0, 0),
        sizes: Vector2(420, 5),
        backgroundColor: Colors.yellow));
    // العنوان
    add(TextComponent(
      text: "⚡ Lightning Rush ⚡",
      textRenderer: TextPaint(
        style: const TextStyle(
          shadows: [
            Shadow(color: Colors.orange, offset: Offset(-3, 0), blurRadius: 6)
          ],
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColor.kPrimaryColor,
        ),
      ),
      position: Vector2(size.x / 2 - 150, 10),
    ));
    add(RoundedShadowCard(
        position: Vector2(0, 50),
        sizes: Vector2(420, 5),
        backgroundColor: Colors.yellow));

    // بطاقة المتصدر الأول
    add(TopPlayerCard(players[0]));

    // قائمة اللاعبين الآخرين
    add(OtherPlayersList(players.skip(0).toList()));

    // زر Claim
    add(ClaimRewardButton());
  }
}

class TopPlayerCard extends PositionComponent {
  final Map<String, dynamic> player;

  TopPlayerCard(this.player);

  @override
  Future<void> onLoad() async {
    position = Vector2(20, 65);

    // البطاقة
    add(RoundedShadowCard(
      sizes: Vector2(370, 150),
      radius: 20,
      backgroundColor: AppColor.kPrimaryColor,
    ));
    // صورة رمزية مؤقتة (دائرة)
    add(TextBoxComponent(
      text: "Rank",
      position: Vector2(50, 0),
    ));
    add(TextBoxComponent(
      text: "Reward",
      position: Vector2(170, 0),
    ));
    // الترتيب
    add(TextComponent(
      text: "#1",
      position: Vector2(100, 50),
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 24, color: Colors.blueGrey),
      ),
    ));

    final sprite = await Sprite.load('close-box.png');
    add(SpriteComponent(size: Vector2(100, 100), position: Vector2(180, 20))
      ..sprite = sprite);
    add(RectangleComponent(
      paint: Paint()..color = const Color.fromARGB(255, 180, 170, 137),
      size: Vector2(100, 30),
      position: Vector2(130, 117),
    ));
    add(TextComponent(
      text: "Finished",
      position: Vector2(143, 120),
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 20, color: Colors.brown),
      ),
    ));
    add(TextComponent(
      text: "⚡",
      position: Vector2(55, 40),
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 40),
      ),
    ));
  }
}

class OtherPlayersList extends PositionComponent {
  final List<Map<String, dynamic>> players;

  OtherPlayersList(this.players);

  @override
  Future<void> onLoad() async {
    position = Vector2(20, 227);
    double yOffset = 0;

    for (var player in players) {
      // البطاقة
      add(RoundedShadowCard(
        shadowColor: player['name'] == "raya"
            ? Color(0xff3c9932)
            : AppColor.kSecondColor,
        sizes: Vector2(370, 60),
        position: Vector2(0, yOffset),
        radius: 15,
        backgroundColor:
            player['name'] == "raya" ? Colors.green : AppColor.kPrimaryColor,
      ));
      add(TextComponent(
        text: player['rank'].toString(),
        position: Vector2(20, yOffset + 20),
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ));
      // صورة رمزية مؤقتة
      final sprite = await Sprite.load(player["image"]);
      add(SpriteComponent(
        size: Vector2(50, 60),
        position: Vector2(40, yOffset),
      )..sprite = sprite);
      // الاسم
      add(TextComponent(
        text: player['name'],
        position: Vector2(100, yOffset + 20),
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ));
      final prize = await Sprite.load(player["prize"] ?? "open-box.png");
      add(SpriteComponent(
        size: Vector2(80, 80),
        position: Vector2(200, yOffset - 5),
      )..sprite = prize);
      add(TextComponent(
        text: "⚡",
        position: Vector2(275, yOffset + 15),
        textRenderer: TextPaint(
          style: const TextStyle(fontSize: 30, shadows: [
            BoxShadow(color: Colors.orange, offset: Offset(1, 1), blurRadius: 5)
          ]),
        ),
      ));
      add(RoundedShadowCard(
        position: Vector2(310, yOffset + 20),
        backgroundColor: AppColor.kThirtColor,
        sizes: Vector2(50, 20),
      ));
      // النقاط
      add(TextComponent(
        text: player['score'].toString(),
        position: Vector2(320, yOffset + 20),
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ));

      yOffset += 70;
    }
  }
}

class ClaimRewardButton extends PositionComponent {
  @override
  Future<void> onLoad() async {
    position = Vector2(0, 595);
    add(
      RoundedShadowCard(
          position: Vector2(0, 0),
          sizes: Vector2(420, 7),
          backgroundColor: Colors.yellow),
    );
    add(RoundedShadowCard(
        position: Vector2(0, 7),
        sizes: Vector2(420, 70),
        backgroundColor: Color(0xFF6026d4)));
    // خلفية الزر
    add(RoundedShadowCard(
        shadowColor: Color(0xff3c9932),
        sizes: Vector2(110, 40),
        radius: 12,
        backgroundColor: Colors.green,
        position: Vector2(163, 15)));
    // النص
    add(TextComponent(
      text: "CLAIM",
      position: Vector2(187, 23),
      textRenderer: TextPaint(
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
      ),
    ));
  }
}

class LeaderboardPage extends StatelessWidget {
  LeaderboardPage({super.key});

  final List<Map<String, dynamic>> players = [
    {
      "rank": 1,
      "name": "raya",
      "score": 531,
      "image": "open-box.png",
      "prize": "close-box.png"
    },
    {"rank": 2, "name": "777", "score": 330, "image": "close-box.png"},
    {"rank": 3, "name": "Anjela", "score": 66, "image": "open-box.png"},
    {"rank": 4, "name": "ukousk", "score": 60, "image": "close-box.png"},
    {"rank": 5, "name": "nasu", "score": 0, "image": "open-box.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GameWidget(game: LeaderboardGame(players))),
    );
  }
}

class RoundedShadowCard extends PositionComponent {
  final Vector2 sizes;
  final double radius;
  final Color backgroundColor;
  final Color shadowColor;

  RoundedShadowCard({
    required this.sizes,
    this.radius = 10,
    this.shadowColor = const Color(0xff99836c),
    this.backgroundColor = Colors.white,
    Vector2? position,
  }) {
    this.sizes.setFrom(sizes);
    this.position = position ?? Vector2.zero();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(0, 0, sizes.x, sizes.y);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // ظل
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0);
    canvas.drawRRect(rrect.shift(const Offset(0, 4)), shadowPaint);

    // الخلفية
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(rrect, bgPaint);
  }
}
