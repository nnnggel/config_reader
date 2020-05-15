import 'package:config_reader/config_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ConfigReader:readProperties', () async {
    Map<String, String> map = await ConfigReader.readProperties("""
    # SOME COMMENTS
    website = https://github.com/nnnggel/config_reader
    language = English
        """);
    expect(map['website'], 'https://github.com/nnnggel/config_reader');
  });

  test('ConfigReader:readOnlineProperties', () async {
    Map<String, String> map = await ConfigReader.readOnlineProperties(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test.properties');
    expect(map['website'], 'https://github.com/nnnggel/config_reader');
  });

  test('ConfigReader:readJson', () async {
    Map<String, dynamic> map = await ConfigReader.readJson(
        '{"website": "https://github.com/nnnggel/config_reader", "version": 1}');
    expect(map['website'], 'https://github.com/nnnggel/config_reader');
  });

  test('ConfigReader:readOnlineJson', () async {
    Map<String, dynamic> map = await ConfigReader.readOnlineJson(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test.json');
    expect(map['version'], 1);
  });
}
