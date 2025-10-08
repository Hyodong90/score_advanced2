class Idol {
  String name;
  List<String> members;

  // 네임드 파라미터 사용
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
}
