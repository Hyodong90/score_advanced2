import 'dart:io';

// 점수만 출력하는 Score 정의

class Score {
  int score;

  Score(this.score);

  void show() {
    print("점수: $score");
  }
}

// Score 상속받은 학생과 점수 클래스 정의
class StudentScore extends Score {
  String name;

  // super 부모클래스 가져오기
  StudentScore(this.name, super.score);

  //클래스 재정의
  @override
  void show() {
    print("이름: $name, 점수: $score");
  }

  @override
  String toString() => "이름: $name, 점수: $score";
}

// 파일에서 학생 데이터 읽기
List<StudentScore> loadStudentData(String filePath) {
  List<StudentScore> studentList = [];

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) {
        throw FormatException('잘못된 데이터 형식: $line');
      }
      //trim은 공백을 없애주는 명령어, 띄어쓰기의 오류발생을 없애줌
      String name = parts[0].trim();
      int score = int.parse(parts[1].trim());

      studentList.add(StudentScore(name, score));
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }

  return studentList;
}

// 결과를 파일에 저장
void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}

void main(List<String> arguments) {
  final dataFile = 'students.txt';
  final resultFile = 'result.txt';

  // 학생 데이터 읽기
  List<StudentScore> studentList = loadStudentData(dataFile);

  StudentScore? selectedStudent;

  // 사용자 입력 반복 -- gpt도움. do while로 널값이 아닐때까지 반복
  do {
    stdout.write("어떤 학생의 통계를 확인하시겠습니까? ");
    //?.trim() 널아니면 양쪽 공백제거
    String? inputName = stdin.readLineSync()?.trim();
    // 이름이 널이거나 공백이면 continue로 처음으로 다시 되돌아가기
    if (inputName == null || inputName.isEmpty) {
      print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
      continue;
    }

    // null-safe 방식으로 학생 찾기  -- gpt도움.
    //where로 참인 것-리스트와 인풋네임이 같아야 출력. List로 변환(inNotEmpty와 first를 사용하기위해)
    var foundList = studentList.where((s) => s.name == inputName).toList();
    //foundlist가 비어있지않으면 first, 비어있으면 널 출력
    selectedStudent = foundList.isNotEmpty ? foundList.first : null;

    if (selectedStudent == null) {
      print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
    }
  } while (selectedStudent == null);

  // 결과 출력
  print(selectedStudent.toString());

  // 결과 파일에 저장
  saveResults(resultFile, selectedStudent.toString());
}
