import 'package:cook_secret/model/cook_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? serialKey = dotenv.env['API_KEY'];

  Dio dio = Dio();

  bool isLoading = true;

  late CookModel cookModel;

  Future<CookModel> getJson() async {
    dio.options = BaseOptions(
      baseUrl: "https://openapi.foodsafetykorea.go.kr/api",
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    String serverPath = '/$serialKey/COOKRCP01/json/1/10';
    try {
      var response = await dio.get(serverPath);
      if (response.statusCode == 200) {
        cookModel = CookModel.fromJson(response.data);
        isLoading = false;
        setState(() {});
        return CookModel.fromJson(response.data);
      } else {
        throw Exception('어떤 오류이지..?');
      }
    } catch (e) {
      throw Exception('어떤오류인가: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getJson();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          var cookdata = cookModel
                              .cookDataModel.cookDataDetailModel[index];
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cookdata.menuName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Gap(8),
                                Image.network(cookdata.smallThumbnail),
                                contextRow(
                                  title: '조리방법',
                                  description: cookdata.cookMethod,
                                ),
                                contextRow(
                                  title: '요리종류',
                                  description: cookdata.cookCategory,
                                ),
                                contextRow(
                                  title: '중량(1인분)',
                                  description: cookdata.personServingGram,
                                ),
                                contextRow(
                                  title: '열량',
                                  description: cookdata.calories,
                                ),
                                contextRow(
                                  title: '탄수화물',
                                  description: cookdata.carbohydrate,
                                ),
                                contextRow(
                                  title: '단벡질',
                                  description: cookdata.protein,
                                ),
                                contextRow(
                                  title: '지방',
                                  description: cookdata.fat,
                                ),
                                contextRow(
                                  title: '나트륨',
                                  description: cookdata.sodium,
                                ),
                                contextRow(
                                  title: '해시태그',
                                  description: cookdata.hashtag,
                                ),
                                contextRow(
                                  title: '재료정보',
                                  description: cookdata.ingredientDetail,
                                ),
                                contextRow(
                                  title: '저감 조리법 TIP',
                                  description: cookdata.reduceSodiumTip,
                                ),
                                const Gap(20),
                                const Text(
                                  '조리법',
                                  style: TextStyle(fontSize: 20),
                                ),
                                ...buildManualList(cookdata), // 매뉴얼 리스트 추가
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(16),
                        itemCount:
                            cookModel.cookDataModel.cookDataDetailModel.length),
                  )
                ],
              ),
            ),
          );
  }

  List<Widget> buildManualList(CookDataDetailModel cookdata) {
    List<String> manuals = [
      cookdata.manual01,
      cookdata.manual02,
      cookdata.manual03,
      cookdata.manual04,
      cookdata.manual05,
      cookdata.manual06,
      cookdata.manual07,
      cookdata.manual08,
      cookdata.manual09,
      cookdata.manual10,
      cookdata.manual11,
      cookdata.manual12,
      cookdata.manual13,
      cookdata.manual14,
      cookdata.manual15,
      cookdata.manual16,
      cookdata.manual17,
      cookdata.manual18,
      cookdata.manual19,
      cookdata.manual20,
    ];

    List<String> manualImages = [
      cookdata.manualImage01,
      cookdata.manualImage02,
      cookdata.manualImage03,
      cookdata.manualImage04,
      cookdata.manualImage05,
      cookdata.manualImage06,
      cookdata.manualImage07,
      cookdata.manualImage08,
      cookdata.manualImage09,
      cookdata.manualImage10,
      cookdata.manualImage11,
      cookdata.manualImage12,
      cookdata.manualImage13,
      cookdata.manualImage14,
      cookdata.manualImage15,
      cookdata.manualImage16,
      cookdata.manualImage17,
      cookdata.manualImage18,
      cookdata.manualImage19,
      cookdata.manualImage20,
    ];

    return List<Widget>.generate(manuals.length, (index) {
      String manual = manuals[index];
      String image = manualImages[index];

      return manual.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                contextRow(
                  title: '조리 매뉴얼 ${index + 1}',
                  description: manual,
                ),
                if (image.isNotEmpty) // 이미지가 존재할 때만 보여줌
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.network(image),
                  ),
              ],
            )
          : const Gap(0); // 빈 매뉴얼은 표시하지 않음
    });
  }

  Widget contextRow({required String title, required String description}) {
    if (description.isEmpty) {
      return const Gap(0); // 빈 문자열이면 빈 컨테이너를 반환하여 표시하지 않음
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Gap(20),
          Expanded(
              child: Text(
            description,
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
