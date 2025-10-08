//점수만 출력하는 Score 정의

class Score {
  int score;

  Score(this.score);

  void show() {
    print("점수: $score");
  }
}

//Score를 상속받은 StudentScore 정의
class StudentScore extends Score {
  String name;

  // super 부모클래스 가져오기
  StudentScore(this.name, super.score);

  //부보 show 재정의
  @override
  void show() {
    print("이름: $name, 점수: $score");
  }
}

void main() {
  // 기본 Score 클래스 사용
  Score a1 = Score(90);
  a1.show();

  print("-----------");
  // 상속받은 StudentScore 클래스 사용
  StudentScore a2 = StudentScore("홍길동", 90);
  StudentScore a3 = StudentScore("김철수", 80);

  a2.show();
  a3.show();
}
