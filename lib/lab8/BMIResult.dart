import 'package:flutter/material.dart';

class BMIResult {
  final String gender;
  final double height;
  final int weight;
  final int age;
  final double bmi;
  final String category;
  final DateTime timestamp;
  final Color categoryColor;
  final String risk;
  final String advice;
  final bool isAthlete;
  final String athleteType; // Thêm thuộc tính để phân biệt loại vận động viên

  BMIResult({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    required this.category,
    required this.timestamp,
    required this.categoryColor,
    required this.risk,
    required this.advice,
    required this.isAthlete,
    this.athleteType = 'general', // Mặc định là vận động viên chung
  });

  // Tính BMI lý tưởng dựa trên chiều cao
  static double calculateIdealBMI(double height) {
    double heightInMeters = height / 100;
    return 22 * (heightInMeters * heightInMeters); // BMI lý tưởng khoảng 22
  }

  // Phân loại BMI với các trường hợp đặc biệt (mở rộng gấp đôi)
  static Map<String, dynamic> getBMICategory(
    double bmi,
    int age,
    bool isAthlete,
    String athleteType, // Thêm tham số để phân biệt loại vận động viên
  ) {
    // Trường hợp trẻ em (dưới 18 tuổi) - Chia nhỏ theo độ tuổi
    if (age < 18) {
      // Trẻ dưới 5 tuổi
      if (age < 5) {
        if (bmi < 12) {
          return {
            'category': 'Thiếu cân nghiêm trọng (trẻ dưới 5 tuổi)',
            'color': Colors.red,
            'risk':
                'Nguy cơ suy dinh dưỡng nặng, chậm phát triển nghiêm trọng.',
            'advice': 'Cần can thiệp y tế ngay, tham khảo bác sĩ nhi khoa.',
          };
        } else if (bmi < 13.5) {
          return {
            'category': 'Thiếu cân trung bình (trẻ dưới 5 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ suy dinh dưỡng, chậm phát triển thể chất.',
            'advice': 'Bổ sung dinh dưỡng, theo dõi cân nặng thường xuyên.',
          };
        } else if (bmi < 15) {
          return {
            'category': 'Thiếu cân nhẹ (trẻ dưới 5 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu chất, ảnh hưởng phát triển.',
            'advice': 'Tăng cường dinh dưỡng, ăn uống đa dạng.',
          };
        } else if (bmi < 18) {
          return {
            'category': 'Bình thường gầy (trẻ dưới 5 tuổi)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống lành mạnh.',
          };
        } else if (bmi < 20) {
          return {
            'category': 'Bình thường khỏe (trẻ dưới 5 tuổi)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, phát triển bình thường.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và vận động.',
          };
        } else if (bmi < 22) {
          return {
            'category': 'Thừa cân nhẹ (trẻ dưới 5 tuổi)',
            'color': Colors.yellow,
            'risk': 'Nguy cơ thừa cân, áp lực tâm lý nhẹ.',
            'advice': 'Kiểm soát lượng calo, khuyến khích vận động.',
          };
        } else if (bmi < 25) {
          return {
            'category': 'Thừa cân (trẻ dưới 5 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ béo phì, tiểu đường sớm.',
            'advice': 'Giảm đồ ăn nhiều calo, tăng hoạt động thể chất.',
          };
        } else {
          return {
            'category': 'Béo phì (trẻ dưới 5 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ cao về béo phì, tiểu đường, tự ti tâm lý.',
            'advice': 'Giảm cân dưới sự hướng dẫn của bác sĩ nhi khoa.',
          };
        }
      }
      // Trẻ 5-12 tuổi
      else if (age < 12) {
        if (bmi < 13) {
          return {
            'category': 'Thiếu cân nghiêm trọng (trẻ 5-12 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ suy dinh dưỡng, chậm lớn, ảnh hưởng học tập.',
            'advice': 'Cần bổ sung dinh dưỡng ngay, tham khảo bác sĩ.',
          };
        } else if (bmi < 14.5) {
          return {
            'category': 'Thiếu cân trung bình (trẻ 5-12 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ thiếu chất, chậm phát triển.',
            'advice': 'Tăng cường dinh dưỡng, theo dõi cân nặng.',
          };
        } else if (bmi < 16) {
          return {
            'category': 'Thiếu cân nhẹ (trẻ 5-12 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu chất, ảnh hưởng sức khỏe.',
            'advice': 'Bổ sung dinh dưỡng, ăn uống đa dạng.',
          };
        } else if (bmi < 20) {
          return {
            'category': 'Bình thường gầy (trẻ 5-12 tuổi)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống lành mạnh.',
          };
        } else if (bmi < 23) {
          return {
            'category': 'Bình thường khỏe (trẻ 5-12 tuổi)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, phát triển bình thường.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và vận động.',
          };
        } else if (bmi < 25) {
          return {
            'category': 'Thừa cân nhẹ (trẻ 5-12 tuổi)',
            'color': Colors.yellow,
            'risk': 'Nguy cơ thừa cân, áp lực tâm lý.',
            'advice': 'Kiểm soát lượng calo, khuyến khích vận động.',
          };
        } else if (bmi < 27) {
          return {
            'category': 'Thừa cân (trẻ 5-12 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ béo phì, tiểu đường, tự ti tâm lý.',
            'advice': 'Giảm đồ ăn nhiều calo, tăng hoạt động thể chất.',
          };
        } else {
          return {
            'category': 'Béo phì (trẻ 5-12 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ cao về tim mạch, tiểu đường, áp lực tâm lý.',
            'advice': 'Giảm cân dưới sự hướng dẫn của bác sĩ.',
          };
        }
      }
      // Trẻ 12-18 tuổi
      else {
        if (bmi < 14) {
          return {
            'category': 'Thiếu cân nghiêm trọng (trẻ 12-18 tuổi)',
            'color': Colors.red,
            'risk':
                'Nguy cơ suy dinh dưỡng, chậm phát triển, yếu hệ miễn dịch.',
            'advice': 'Cần bổ sung dinh dưỡng ngay, tham khảo bác sĩ nhi khoa.',
          };
        } else if (bmi < 15.5) {
          return {
            'category': 'Thiếu cân trung bình (trẻ 12-18 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ thiếu chất, chậm lớn, ảnh hưởng học tập.',
            'advice': 'Tăng cường dinh dưỡng, theo dõi cân nặng thường xuyên.',
          };
        } else if (bmi < 17) {
          return {
            'category': 'Thiếu cân nhẹ (trẻ 12-18 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu chất, ảnh hưởng phát triển.',
            'advice': 'Tăng lượng calo, ăn uống đa dạng.',
          };
        } else if (bmi < 21) {
          return {
            'category': 'Bình thường gầy (trẻ 12-18 tuổi)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống lành mạnh.',
          };
        } else if (bmi < 24) {
          return {
            'category': 'Bình thường khỏe (trẻ 12-18 tuổi)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, phát triển bình thường.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và vận động.',
          };
        } else if (bmi < 26) {
          return {
            'category': 'Thừa cân nhẹ (trẻ 12-18 tuổi)',
            'color': Colors.yellow,
            'risk': 'Nguy cơ thừa cân, áp lực tâm lý.',
            'advice': 'Kiểm soát lượng calo, khuyến khích vận động.',
          };
        } else if (bmi < 28) {
          return {
            'category': 'Thừa cân (trẻ 12-18 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ béo phì, tiểu đường, tự ti tâm lý.',
            'advice': 'Giảm đồ ăn nhiều calo, tăng hoạt động thể chất.',
          };
        } else {
          return {
            'category': 'Béo phì (trẻ 12-18 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ cao về tim mạch, tiểu đường, tự ti tâm lý.',
            'advice': 'Giảm cân dưới sự hướng dẫn của bác sĩ, tăng hoạt động.',
          };
        }
      }
    }

    // Trường hợp người cao tuổi (trên 65 tuổi) - Chia nhỏ theo độ tuổi
    if (age > 65) {
      // Người cao tuổi 65-80 tuổi
      if (age <= 80) {
        if (bmi < 18) {
          return {
            'category': 'Thiếu cân nghiêm trọng (người 65-80 tuổi)',
            'color': Colors.red,
            'risk':
                'Nguy cơ suy dinh dưỡng nặng, loãng xương, yếu cơ nghiêm trọng.',
            'advice':
                'Tăng cường dinh dưỡng, bổ sung protein, tham khảo bác sĩ.',
          };
        } else if (bmi < 20) {
          return {
            'category': 'Thiếu cân (người 65-80 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ suy dinh dưỡng, loãng xương, yếu cơ.',
            'advice': 'Tăng lượng calo, bổ sung dinh dưỡng, tham khảo bác sĩ.',
          };
        } else if (bmi < 22) {
          return {
            'category': 'Bình thường gầy (người 65-80 tuổi)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống lành mạnh, vận động nhẹ nhàng.',
          };
        } else if (bmi < 25) {
          return {
            'category': 'Bình thường khỏe (người 65-80 tuổi)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, ít nguy cơ.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và vận động.',
          };
        } else if (bmi < 27) {
          return {
            'category': 'Thừa cân nhẹ (người 65-80 tuổi)',
            'color': Colors.yellow,
            'risk': 'Nguy cơ nhẹ về tim mạch, đau khớp.',
            'advice': 'Kiểm soát cân nặng, tập thể dục nhẹ như đi bộ, yoga.',
          };
        } else if (bmi < 29) {
          return {
            'category': 'Thừa cân (người 65-80 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ cao huyết áp, tiểu đường, đau khớp.',
            'advice': 'Giảm cân từ từ, ăn uống lành mạnh, tham khảo bác sĩ.',
          };
        } else if (bmi < 32) {
          return {
            'category': 'Béo phì nhẹ (người 65-80 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ cao: tim mạch, tiểu đường, khó thở.',
            'advice':
                'Giảm cân dưới sự giám sát y tế, tập trung vào sức khỏe tim mạch.',
          };
        } else {
          return {
            'category': 'Béo phì nghiêm trọng (người 65-80 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ rất cao: tim mạch, đột quỵ, khó thở.',
            'advice': 'Giảm cân khẩn cấp, cần hỗ trợ y tế chuyên sâu.',
          };
        }
      }
      // Người cao tuổi trên 80 tuổi
      else {
        if (bmi < 19) {
          return {
            'category': 'Thiếu cân nghiêm trọng (người trên 80 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ suy dinh dưỡng nặng, yếu cơ, dễ té ngã.',
            'advice':
                'Tăng cường dinh dưỡng, bổ sung protein, cần chăm sóc y tế.',
          };
        } else if (bmi < 21) {
          return {
            'category': 'Thiếu cân (người trên 80 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ suy dinh dưỡng, loãng xương, yếu cơ.',
            'advice': 'Tăng lượng calo, bổ sung dinh dưỡng, tham khảo bác sĩ.',
          };
        } else if (bmi < 23) {
          return {
            'category': 'Bình thường gầy (người trên 80 tuổi)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống lành mạnh, vận động nhẹ nhàng.',
          };
        } else if (bmi < 26) {
          return {
            'category': 'Bình thường khỏe (người trên 80 tuổi)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, ít nguy cơ.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và vận động nhẹ.',
          };
        } else if (bmi < 28) {
          return {
            'category': 'Thừa cân nhẹ (người trên 80 tuổi)',
            'color': Colors.yellow,
            'risk': 'Nguy cơ nhẹ về tim mạch, đau khớp.',
            'advice': 'Kiểm soát cân nặng, tập thể dục nhẹ như đi bộ.',
          };
        } else if (bmi < 30) {
          return {
            'category': 'Thừa cân (người trên 80 tuổi)',
            'color': Colors.orange,
            'risk': 'Nguy cơ cao huyết áp, tiểu đường, khó thở.',
            'advice': 'Giảm cân từ từ, ăn uống lành mạnh, tham khảo bác sĩ.',
          };
        } else if (bmi < 33) {
          return {
            'category': 'Béo phì nhẹ (người trên 80 tuổi)',
            'color': Colors.red,
            'risk': 'Nguy cơ cao: tim mạch, đột quỵ, khó thở.',
            'advice':
                'Giảm cân dưới sự giám sát y tế, tập trung vào sức khỏe tim mạch.',
          };
        } else {
          return {
            'category': 'Béo phì nghiêm trọng (người trên 80 tuổi)',
            'color': Colors.redAccent,
            'risk': 'Nguy cơ rất cao: tim mạch, đột quỵ, giảm tuổi thọ.',
            'advice': 'Giảm cân khẩn cấp, cần hỗ trợ y tế chuyên sâu.',
          };
        }
      }
    }

    // Trường hợp vận động viên - Chia nhỏ theo loại hình vận động
    if (isAthlete) {
      // Vận động viên sức bền (endurance)
      if (athleteType == 'endurance') {
        if (bmi < 17) {
          return {
            'category': 'Thiếu cân nghiêm trọng (vđv sức bền)',
            'color': Colors.red,
            'risk': 'Nguy cơ thiếu năng lượng nghiêm trọng, giảm hiệu suất.',
            'advice': 'Tăng lượng calo từ carbohydrate, bổ sung protein.',
          };
        } else if (bmi < 18.5) {
          return {
            'category': 'Thiếu cân (vđv sức bền)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu năng lượng, giảm hiệu suất thi đấu.',
            'advice': 'Tăng lượng calo từ thực phẩm giàu carbohydrate.',
          };
        } else if (bmi < 22) {
          return {
            'category': 'Bình thường gầy (vđv sức bền)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống và luyện tập cân đối.',
          };
        } else if (bmi < 25) {
          return {
            'category': 'Bình thường khỏe (vđv sức bền)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, hiệu suất ổn định.',
            'advice': 'Tiếp tục duy trì chế độ ăn uống và luyện tập.',
          };
        } else if (bmi < 27) {
          return {
            'category': 'Hơi thừa cân (vđv sức bền)',
            'color': Colors.yellow,
            'risk': 'Có thể ảnh hưởng tốc độ và sức bền.',
            'advice': 'Kiểm tra tỷ lệ mỡ, điều chỉnh chế độ ăn uống.',
          };
        } else if (bmi < 29) {
          return {
            'category': 'Thừa cân (vđv sức bền)',
            'color': Colors.orange,
            'risk': 'Nguy cơ giảm hiệu suất, tăng nguy cơ chấn thương.',
            'advice': 'Giảm cân nhẹ, tập trung vào sức bền và giảm mỡ.',
          };
        } else {
          return {
            'category': 'Cần kiểm tra (vđv sức bền)',
            'color': Colors.red,
            'risk': 'Nguy cơ thừa mỡ, giảm hiệu suất, chấn thương.',
            'advice': 'Kiểm tra tỷ lệ mỡ, điều chỉnh chế độ tập luyện.',
          };
        }
      }
      // Vận động viên sức mạnh (strength)
      else if (athleteType == 'strength') {
        if (bmi < 20) {
          return {
            'category': 'Thiếu cân (vđv sức mạnh affections)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu cơ bắp, giảm sức mạnh.',
            'advice': 'Tăng lượng calo, bổ sung protein để phát triển cơ.',
          };
        } else if (bmi < 25) {
          return {
            'category': 'Bình thường gầy (vđv sức mạnh)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần phát triển cơ bắp.',
            'advice': 'Tăng lượng protein, tập trung vào tập sức mạnh.',
          };
        } else if (bmi < 28) {
          return {
            'category': 'Bình thường khỏe (vđv sức mạnh)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, cơ bắp phát triển tốt.',
            'advice': 'Duy trì chế độ ăn uống và luyện tập chuyên sâu.',
          };
        } else if (bmi < 32) {
          return {
            'category': 'Khối cơ cao (vđv sức mạnh)',
            'color': Colors.yellow,
            'risk':
                'Có thể không nguy hiểm nếu do cơ bắp, nhưng cần kiểm tra tỷ lệ mỡ.',
            'advice': 'Kiểm tra tỷ lệ mỡ, duy trì luyện tập chuyên sâu.',
          };
        } else if (bmi < 35) {
          return {
            'category': 'Khối cơ rất cao (vđv sức mạnh)',
            'color': Colors.orange,
            'risk': 'Có thể thừa mỡ hoặc cơ bắp quá mức, nguy cơ chấn thương.',
            'advice': 'Kiểm tra tỷ lệ mỡ, điều chỉnh chế độ dinh dưỡng.',
          };
        } else {
          return {
            'category': 'Cần kiểm tra (vđv sức mạnh)',
            'color': Colors.red,
            'risk': 'Nguy cơ thừa mỡ, chấn thương khớp, giảm hiệu suất.',
            'advice': 'Giảm mỡ, kiểm tra sức khỏe tổng quát.',
          };
        }
      }
      // Vận động viên chung (không phân loại cụ thể)
      else {
        if (bmi < 17) {
          return {
            'category': 'Thiếu cân nghiêm trọng (vđv)',
            'color': Colors.red,
            'risk': 'Nguy cơ thiếu năng lượng nghiêm trọng, giảm hiệu suất.',
            'advice': 'Tăng lượng calo từ protein và carbohydrate.',
          };
        } else if (bmi < 18.5) {
          return {
            'category': 'Thiếu cân (vđv)',
            'color': Colors.orange,
            'risk': 'Nguy cơ thiếu năng lượng, giảm hiệu suất thi đấu.',
            'advice':
                'Tăng lượng calo từ thực phẩm giàu protein và carbohydrate.',
          };
        } else if (bmi < 23) {
          return {
            'category': 'Bình thường gầy (vđv)',
            'color': Colors.greenAccent,
            'risk': 'Sức khỏe ổn định, nhưng cần theo dõi.',
            'advice': 'Duy trì chế độ ăn uống và luyện tập cân đối.',
          };
        } else if (bmi < 27) {
          return {
            'category': 'Bình thường khỏe (vđv)',
            'color': Colors.green,
            'risk': 'Sức khỏe tốt, cơ bắp phát triển, ít nguy cơ.',
            'advice': 'Duy trì chế độ ăn uống và luyện tập cân đối.',
          };
        } else if (bmi < 30) {
          return {
            'category': 'Khối cơ cao (vđv)',
            'color': Colors.yellow,
            'risk':
                'Có thể không nguy hiểm nếu do cơ bắp, nhưng cần kiểm tra tỷ lệ mỡ.',
            'advice': 'Kiểm tra tỷ lệ mỡ cơ thể, duy trì luyện tập chuyên sâu.',
          };
        } else if (bmi < 33) {
          return {
            'category': 'Khối cơ rất cao (vđv)',
            'color': Colors.orange,
            'risk': 'Có thể thừa mỡ hoặc cơ bắp quá mức, nguy cơ chấn thương.',
            'advice': 'Kiểm tra tỷ lệ mỡ, điều chỉnh chế độ dinh dưỡng.',
          };
        } else {
          return {
            'category': 'Cần kiểm tra (vđv)',
            'color': Colors.red,
            'risk': 'Nguy cơ thừa mỡ hoặc cơ bắp quá mức, chấn thương khớp.',
            'advice': 'Kiểm tra tỷ lệ mỡ, điều chỉnh chế độ tập luyện.',
          };
        }
      }
    }

    // Trường hợp người lớn thông thường (18-65 tuổi) - Chia nhỏ hơn
    if (bmi < 15) {
      return {
        'category': 'Thiếu cân rất nghiêm trọng',
        'color': Colors.red,
        'risk':
            'Nguy cơ cực cao: suy dinh dưỡng, loãng xương, suy giảm nội tạng.',
        'advice': 'Cần can thiệp y tế ngay, tham khảo bác sĩ dinh dưỡng.',
      };
    } else if (bmi < 16) {
      return {
        'category': 'Thiếu cân nghiêm trọng',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ cao: suy dinh dưỡng, loãng xương, yếu hệ miễn dịch.',
        'advice': 'Tăng cân lành mạnh, tham khảo ý kiến bác sĩ dinh dưỡng.',
      };
    } else if (bmi < 16.5) {
      return {
        'category': 'Thiếu cân nặng',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ suy dinh dưỡng, mệt mỏi, giảm sức đề kháng.',
        'advice': 'Tăng lượng calo, bổ sung dinh dưỡng, tập luyện nhẹ.',
      };
    } else if (bmi < 17) {
      return {
        'category': 'Thiếu cân trung bình',
        'color': Colors.orange,
        'risk': 'Nguy cơ thiếu chất, mệt mỏi, giảm năng lượng.',
        'advice': 'Tăng lượng calo, ăn uống đa dạng, tập thể dục nhẹ.',
      };
    } else if (bmi < 18) {
      return {
        'category': 'Thiếu cân nhẹ',
        'color': Colors.orangeAccent,
        'risk': 'Nguy cơ nhẹ về thiếu chất, mệt mỏi.',
        'advice': 'Tăng lượng calo, bổ sung dinh dưỡng cân đối.',
      };
    } else if (bmi < 19) {
      return {
        'category': 'Rất gầy',
        'color': Colors.yellow,
        'risk': 'Nguy cơ nhẹ về sức khỏe, cần cải thiện cân nặng.',
        'advice': 'Tăng cân nhẹ, ăn uống lành mạnh, tập thể dục.',
      };
    } else if (bmi < 21) {
      return {
        'category': 'Gầy',
        'color': Colors.greenAccent,
        'risk': 'Sức khỏe ổn định, ít nguy cơ.',
        'advice': 'Duy trì lối sống lành mạnh, tập thể dục đều đặn.',
      };
    } else if (bmi < 23) {
      return {
        'category': 'Bình thường gầy',
        'color': Colors.greenAccent,
        'risk': 'Sức khỏe ổn định, ít nguy cơ.',
        'advice': 'Duy trì chế độ ăn uống và vận động lành mạnh.',
      };
    } else if (bmi < 24) {
      return {
        'category': 'Bình thường khỏe',
        'color': Colors.green,
        'risk': 'Sức khỏe tốt, nguy cơ thấp.',
        'advice': 'Giữ chế độ ăn uống và vận động cân đối.',
      };
    } else if (bmi < 25) {
      return {
        'category': 'Bình thường hơi nặng',
        'color': Colors.green,
        'risk': 'Sức khỏe tốt, nguy cơ rất thấp.',
        'advice': 'Duy trì lối sống lành mạnh, tập thể dục thường xuyên.',
      };
    } else if (bmi < 26) {
      return {
        'category': 'Hơi thừa cân',
        'color': Colors.yellow,
        'risk': 'Nguy cơ rất nhẹ về huyết áp, cholesterol.',
        'advice': 'Kiểm soát cân nặng, tập thể dục thường xuyên.',
      };
    } else if (bmi < 27) {
      return {
        'category': 'Thừa cân nhẹ',
        'color': Colors.yellowAccent,
        'risk': 'Nguy cơ nhẹ về huyết áp, cholesterol cao.',
        'advice': 'Kiểm soát cân nặng, tập thể dục, giảm đồ ăn nhiều calo.',
      };
    } else if (bmi < 28) {
      return {
        'category': 'Thừa cân trung bình',
        'color': Colors.orange,
        'risk': 'Nguy cơ huyết áp cao, cholesterol cao.',
        'advice': 'Giảm cân nhẹ, ăn uống lành mạnh, tập thể dục.',
      };
    } else if (bmi < 30) {
      return {
        'category': 'Thừa cân nặng',
        'color': Colors.orangeAccent,
        'risk': 'Nguy cơ cao huyết áp, tiểu đường type 2, đau khớp.',
        'advice': 'Giảm cân từ từ, ăn uống lành mạnh, tập thể dục.',
      };
    } else if (bmi < 32) {
      return {
        'category': 'Béo phì nhẹ',
        'color': Colors.red,
        'risk': 'Nguy cơ cao về tim mạch, tiểu đường, đau khớp.',
        'advice': 'Giảm cân ngay, tham khảo ý kiến bác sĩ.',
      };
    } else if (bmi < 35) {
      return {
        'category': 'Béo phì cấp độ 1',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ rất cao: tim mạch, tiểu đường, đau khớp.',
        'advice': 'Giảm cân dưới sự giám sát y tế, tập trung vào sức khỏe.',
      };
    } else if (bmi < 37) {
      return {
        'category': 'Béo phì cấp độ 2 nhẹ',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ rất cao: tim mạch, đột quỵ, tiểu đường.',
        'advice': 'Giảm cân khẩn cấp, cần bác sĩ hỗ trợ.',
      };
    } else if (bmi < 40) {
      return {
        'category': 'Béo phì cấp độ 2 nặng',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ cực cao: tim mạch, đột quỵ, khó thở.',
        'advice': 'Giảm cân khẩn cấp, cần hỗ trợ y tế chuyên sâu.',
      };
    } else if (bmi < 45) {
      return {
        'category': 'Béo phì cấp độ 3',
        'color': Colors.redAccent,
        'risk': 'Nguy cơ cực cao: tim mạch, đột quỵ, giảm tuổi thọ.',
        'advice': 'Giảm cân ngay lập tức, cần hỗ trợ y tế chuyên sâu.',
      };
    } else {
      return {
        'category': 'Béo phì cấp độ 3 rất nguy hiểm',
        'color': Colors.red,
        'risk': 'Nguy cơ cực kỳ cao: tim mạch, đột quỵ, nguy hiểm tính mạng.',
        'advice': 'Cần can thiệp y tế ngay lập tức, giảm cân khẩn cấp.',
      };
    }
  }
}
