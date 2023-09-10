import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI Audio Group Code

class OpenAIAudioGroup {
  static String baseUrl = 'https://api.openai.com/v1/audio/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer OPENAIAPIKEY',
  };
  static TranscriptionsCall transcriptionsCall = TranscriptionsCall();
}

class TranscriptionsCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'transcriptions',
      apiUrl: '${OpenAIAudioGroup.baseUrl}transcriptions',
      callType: ApiCallType.POST,
      headers: {
        ...OpenAIAudioGroup.headers,
      },
      params: {
        'file': file,
        'model': "whisper-1",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End OpenAI Audio Group Code

/// Start Google Speech Group Code

class GoogleSpeechGroup {
  static String baseUrl = 'https://speech.googleapis.com/v1/speech';
  static Map<String, String> headers = {};
  static RecognizeCall recognizeCall = RecognizeCall();
}

class RecognizeCall {
  Future<ApiCallResponse> call({
    String? audioAsBytes = '',
  }) {
    final ffApiRequestBody = '''
{
  "audio": {
    "content": "${audioAsBytes}"
  },
  "config": {
    "languageCode": "en-US"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'recognize',
      apiUrl:
          '${GoogleSpeechGroup.baseUrl}:recognize?key=AIzaSyBymKr-8npc8uZpMoKRQLjK45OzfkLVXZc',
      callType: ApiCallType.POST,
      headers: {
        ...GoogleSpeechGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Google Speech Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
