import 'package:score_advanced/score_advanced.dart';
import 'package:test/test.dart';

class Idol {
  String name;
  List<String> members;

  Idol({required this.name, required this.members});

  void introduce() {
    print("안녕하세요, 저희는 $name입니다!");
    print("멤버: $members");
  }
}

class BoyIdol extends Idol {
  int age;

  BoyIdol({required super.name, required super.members, required this.age});
}

void main() {
  Idol blackpink = Idol(name: "블랙핑크", members: ["리사", "제니", "지수"]);
  blackpink.introduce();

  BoyIdol bts = BoyIdol(name: "BTS", members: ["RM", "진", "슈가"], age: 7);
  bts.introduce();
  print("BTS 그룹 나이: ${bts.age}");
}