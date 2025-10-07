import 'dart:io';


void loadStudentData(String filePath) {
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    
  }
  return;
}

void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}

void main() {
  loadStudentData('/Users/gimhyodong/Desktop/proj/score_advanced2/students.txt');
}
