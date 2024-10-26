import 'package:equatable/equatable.dart';

class CookModel extends Equatable {
  final CookDataModel cookDataModel;

  const CookModel({required this.cookDataModel});

  Map<String, dynamic> toJson() {
    return {
      'COOKRCP01': cookDataModel,
    };
  }

  CookModel.init()
      : this(
          cookDataModel: CookDataModel.init(),
        );

  factory CookModel.fromJson(Map<String, dynamic> json) {
    return CookModel(
      cookDataModel: json['COOKRCP01'] is Map
          ? CookDataModel.fromJson(json['COOKRCP01'])
          : CookDataModel.init(),
    );
  }

  CookModel copyWith({
    CookDataModel? cookDataModel,
  }) {
    return CookModel(
      cookDataModel: cookDataModel ?? this.cookDataModel,
    );
  }

  @override
  List<Object?> get props => [cookDataModel];
}

class CookDataModel extends Equatable {
  final String totalCount;
  final List<CookDataDetailModel> cookDataDetailModel;
  final ResultModel result;

  const CookDataModel({
    required this.totalCount,
    required this.cookDataDetailModel,
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'row': cookDataDetailModel,
      'RESULT': result,
    };
  }

  CookDataModel.init()
      : this(
          totalCount: '',
          cookDataDetailModel: [],
          result: const ResultModel.init(),
        );

  factory CookDataModel.fromJson(Map<String, dynamic> json) {
    return CookDataModel(
      totalCount: json['total_count'] ?? '',
      cookDataDetailModel: (json['row'] as List<dynamic>?)
              ?.map(
                (item) => CookDataDetailModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
      result: json['RESULT'] is Map
          ? ResultModel.fromJson(json['RESULT'])
          : const ResultModel.init(),
    );
  }

  CookDataModel copyWith({
    String? totalCount,
    List<CookDataDetailModel>? cookDataDetailModel,
    ResultModel? result,
  }) {
    return CookDataModel(
      totalCount: totalCount ?? this.totalCount,
      cookDataDetailModel: cookDataDetailModel ?? this.cookDataDetailModel,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [totalCount, cookDataDetailModel, result];
}

class CookDataDetailModel extends Equatable {
  final String serialNo;
  final String menuName;
  final String cookMethod;
  final String cookCategory;
  final String personServingGram;
  final String calories;
  final String carbohydrate;
  final String protein;
  final String fat;
  final String sodium;
  final String ingredientDetail;
  final String hashtag;
  final String bigThumbnail;
  final String smallThumbnail;
  final String manual01;
  final String manual02;
  final String manual03;
  final String manual04;
  final String manual05;
  final String manual06;
  final String manual07;
  final String manual08;
  final String manual09;
  final String manual10;
  final String manual11;
  final String manual12;
  final String manual13;
  final String manual14;
  final String manual15;
  final String manual16;
  final String manual17;
  final String manual18;
  final String manual19;
  final String manual20;
  final String manualImage01;
  final String manualImage02;
  final String manualImage03;
  final String manualImage04;
  final String manualImage05;
  final String manualImage06;
  final String manualImage07;
  final String manualImage08;
  final String manualImage09;
  final String manualImage10;
  final String manualImage11;
  final String manualImage12;
  final String manualImage13;
  final String manualImage14;
  final String manualImage15;
  final String manualImage16;
  final String manualImage17;
  final String manualImage18;
  final String manualImage19;
  final String manualImage20;
  final String reduceSodiumTip;

  const CookDataDetailModel({
    required this.serialNo,
    required this.menuName,
    required this.cookMethod,
    required this.cookCategory,
    required this.personServingGram,
    required this.calories,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    required this.sodium,
    required this.ingredientDetail,
    required this.hashtag,
    required this.bigThumbnail,
    required this.smallThumbnail,
    required this.manual01,
    required this.manual02,
    required this.manual03,
    required this.manual04,
    required this.manual05,
    required this.manual06,
    required this.manual07,
    required this.manual08,
    required this.manual09,
    required this.manual10,
    required this.manual11,
    required this.manual12,
    required this.manual13,
    required this.manual14,
    required this.manual15,
    required this.manual16,
    required this.manual17,
    required this.manual18,
    required this.manual19,
    required this.manual20,
    required this.manualImage01,
    required this.manualImage02,
    required this.manualImage03,
    required this.manualImage04,
    required this.manualImage05,
    required this.manualImage06,
    required this.manualImage07,
    required this.manualImage08,
    required this.manualImage09,
    required this.manualImage10,
    required this.manualImage11,
    required this.manualImage12,
    required this.manualImage13,
    required this.manualImage14,
    required this.manualImage15,
    required this.manualImage16,
    required this.manualImage17,
    required this.manualImage18,
    required this.manualImage19,
    required this.manualImage20,
    required this.reduceSodiumTip,
  });

  Map<String, dynamic> toJson() {
    return {
      'RCP_SEQ': serialNo,
      'RCP_NM': menuName,
      'RCP_WAY2': cookMethod,
      'RCP_PAT2': cookCategory,
      'INFO_WGT': personServingGram,
      'INFO_ENG': calories,
      'INFO_CAR': carbohydrate,
      'INFO_PRO': protein,
      'INFO_FAT': fat,
      'INFO_NA': sodium,
      'RCP_PARTS_DTLS': ingredientDetail,
      'HASH_TAG': hashtag,
      'ATT_FILE_NO_MAIN': smallThumbnail,
      'ATT_FILE_NO_MK': bigThumbnail,
      'MANUAL01': manual01,
      'MANUAL02': manual02,
      'MANUAL03': manual03,
      'MANUAL04': manual04,
      'MANUAL05': manual05,
      'MANUAL06': manual06,
      'MANUAL07': manual07,
      'MANUAL08': manual08,
      'MANUAL09': manual09,
      'MANUAL10': manual10,
      'MANUAL11': manual11,
      'MANUAL12': manual12,
      'MANUAL13': manual13,
      'MANUAL14': manual14,
      'MANUAL15': manual15,
      'MANUAL16': manual16,
      'MANUAL17': manual17,
      'MANUAL18': manual18,
      'MANUAL19': manual19,
      'MANUAL20': manual20,
      'MANUAL_IMG01': manualImage01,
      'MANUAL_IMG02': manualImage02,
      'MANUAL_IMG03': manualImage03,
      'MANUAL_IMG04': manualImage04,
      'MANUAL_IMG05': manualImage05,
      'MANUAL_IMG06': manualImage06,
      'MANUAL_IMG07': manualImage07,
      'MANUAL_IMG08': manualImage08,
      'MANUAL_IMG09': manualImage09,
      'MANUAL_IMG10': manualImage10,
      'MANUAL_IMG11': manualImage11,
      'MANUAL_IMG12': manualImage12,
      'MANUAL_IMG13': manualImage13,
      'MANUAL_IMG14': manualImage14,
      'MANUAL_IMG15': manualImage15,
      'MANUAL_IMG16': manualImage16,
      'MANUAL_IMG17': manualImage17,
      'MANUAL_IMG18': manualImage18,
      'MANUAL_IMG19': manualImage19,
      'MANUAL_IMG20': manualImage20,
      'RCP_NA_TIP': reduceSodiumTip,
    };
  }

  const CookDataDetailModel.init()
      : this(
          serialNo: '',
          menuName: '',
          cookMethod: '',
          cookCategory: '',
          personServingGram: '',
          calories: '',
          carbohydrate: '',
          protein: '',
          fat: '',
          sodium: '',
          ingredientDetail: '',
          hashtag: '',
          bigThumbnail: '',
          smallThumbnail: '',
          manual01: '',
          manual02: '',
          manual03: '',
          manual04: '',
          manual05: '',
          manual06: '',
          manual07: '',
          manual08: '',
          manual09: '',
          manual10: '',
          manual11: '',
          manual12: '',
          manual13: '',
          manual14: '',
          manual15: '',
          manual16: '',
          manual17: '',
          manual18: '',
          manual19: '',
          manual20: '',
          manualImage01: '',
          manualImage02: '',
          manualImage03: '',
          manualImage04: '',
          manualImage05: '',
          manualImage06: '',
          manualImage07: '',
          manualImage08: '',
          manualImage09: '',
          manualImage10: '',
          manualImage11: '',
          manualImage12: '',
          manualImage13: '',
          manualImage14: '',
          manualImage15: '',
          manualImage16: '',
          manualImage17: '',
          manualImage18: '',
          manualImage19: '',
          manualImage20: '',
          reduceSodiumTip: '',
        );

  factory CookDataDetailModel.fromJson(Map<String, dynamic> json) {
    return CookDataDetailModel(
      serialNo: json['RCP_SEQ'] ?? '',
      menuName: json['RCP_NM'] ?? '',
      cookMethod: json['RCP_WAY2'] ?? '',
      cookCategory: json['RCP_PAT2'] ?? '',
      personServingGram: json['INFO_WGT'] ?? '',
      calories: json['INFO_ENG'] ?? '',
      carbohydrate: json['INFO_CAR'] ?? '',
      protein: json['INFO_PRO'] ?? '',
      fat: json['INFO_FAT'] ?? '',
      sodium: json['INFO_NA'] ?? '',
      ingredientDetail: json['RCP_PARTS_DTLS'] ?? '',
      hashtag: json['HASH_TAG'] ?? '',
      smallThumbnail: json['ATT_FILE_NO_MAIN'] ?? '',
      bigThumbnail: json['ATT_FILE_NO_MK'] ?? '',
      manual01: json['MANUAL01'] ?? '',
      manual02: json['MANUAL02'] ?? '',
      manual03: json['MANUAL03'] ?? '',
      manual04: json['MANUAL04'] ?? '',
      manual05: json['MANUAL05'] ?? '',
      manual06: json['MANUAL06'] ?? '',
      manual07: json['MANUAL07'] ?? '',
      manual08: json['MANUAL08'] ?? '',
      manual09: json['MANUAL09'] ?? '',
      manual10: json['MANUAL10'] ?? '',
      manual11: json['MANUAL11'] ?? '',
      manual12: json['MANUAL12'] ?? '',
      manual13: json['MANUAL13'] ?? '',
      manual14: json['MANUAL14'] ?? '',
      manual15: json['MANUAL15'] ?? '',
      manual16: json['MANUAL16'] ?? '',
      manual17: json['MANUAL17'] ?? '',
      manual18: json['MANUAL18'] ?? '',
      manual19: json['MANUAL19'] ?? '',
      manual20: json['MANUAL20'] ?? '',
      manualImage01: json['MANUAL_IMG01'] ?? '',
      manualImage02: json['MANUAL_IMG02'] ?? '',
      manualImage03: json['MANUAL_IMG03'] ?? '',
      manualImage04: json['MANUAL_IMG04'] ?? '',
      manualImage05: json['MANUAL_IMG05'] ?? '',
      manualImage06: json['MANUAL_IMG06'] ?? '',
      manualImage07: json['MANUAL_IMG07'] ?? '',
      manualImage08: json['MANUAL_IMG08'] ?? '',
      manualImage09: json['MANUAL_IMG09'] ?? '',
      manualImage10: json['MANUAL_IMG10'] ?? '',
      manualImage11: json['MANUAL_IMG11'] ?? '',
      manualImage12: json['MANUAL_IMG12'] ?? '',
      manualImage13: json['MANUAL_IMG13'] ?? '',
      manualImage14: json['MANUAL_IMG14'] ?? '',
      manualImage15: json['MANUAL_IMG15'] ?? '',
      manualImage16: json['MANUAL_IMG16'] ?? '',
      manualImage17: json['MANUAL_IMG17'] ?? '',
      manualImage18: json['MANUAL_IMG18'] ?? '',
      manualImage19: json['MANUAL_IMG19'] ?? '',
      manualImage20: json['MANUAL_IMG20'] ?? '',
      reduceSodiumTip: json['RCP_NA_TIP'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        serialNo,
        menuName,
        cookMethod,
        cookCategory,
        personServingGram,
        calories,
        carbohydrate,
        protein,
        fat,
        sodium,
        ingredientDetail,
        hashtag,
        bigThumbnail,
        smallThumbnail,
        manual01,
        manual02,
        manual03,
        manual04,
        manual05,
        manual06,
        manual07,
        manual08,
        manual09,
        manual10,
        manual11,
        manual12,
        manual13,
        manual14,
        manual15,
        manual16,
        manual17,
        manual18,
        manual19,
        manual20,
        manualImage01,
        manualImage02,
        manualImage03,
        manualImage04,
        manualImage05,
        manualImage06,
        manualImage07,
        manualImage08,
        manualImage09,
        manualImage10,
        manualImage11,
        manualImage12,
        manualImage13,
        manualImage14,
        manualImage15,
        manualImage16,
        manualImage17,
        manualImage18,
        manualImage19,
        manualImage20,
        reduceSodiumTip,
      ];
}

class ResultModel extends Equatable {
  final String message;
  final String code;

  const ResultModel({
    required this.message,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'MSG': message,
      'CODE': code,
    };
  }

  const ResultModel.init()
      : this(
          message: '',
          code: '',
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      message: json['MSG'] ?? '',
      code: json['CODE'] ?? '',
    );
  }

  ResultModel copyWith({
    String? message,
    String? code,
  }) {
    return ResultModel(
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}
