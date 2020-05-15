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
    // map
    Map<String, dynamic> map = await ConfigReader.readJson(
        '{"website": "https://github.com/nnnggel/config_reader", "version": 1}');
    expect(map['website'], 'https://github.com/nnnggel/config_reader');

    // list
    Map<String, dynamic> map2 = await ConfigReader.readJson("""
    [
      "Cat",
      "Dog",
      "Goldfish"
    ]
    """);
    expect(map2['list'][0], "Cat");
  });

  test('ConfigReader:readOnlineJson', () async {
    // map
    Map<String, dynamic> map = await ConfigReader.readOnlineJson(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test_map.json');
    expect(map['version'], 1);

    // list
    Map<String, dynamic> map2 = await ConfigReader.readOnlineJson(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test_list.json');
    expect(map2['list'][0], "Cat");
  });

  test('ConfigReader:readYaml', () async {
    // map
    Map<dynamic, dynamic> map = await ConfigReader.readYaml("""
languages:
  - Ruby
  - Perl
  - Python
websites:
  YAML: yaml.org
  Ruby: ruby-lang.org
  Python: python.org
  Perl: use.perl.org
        """);
    expect(map['websites']['YAML'], 'yaml.org');
    expect(map['languages'][0], 'Ruby');

    // list
    Map<dynamic, dynamic> map2 = await ConfigReader.readYaml("""
- Cat
- Dog
- Goldfish
        """);
    expect(map2['list'][0], 'Cat');
  });

  test('ConfigReader:readOnlineJson', () async {
    // map
    Map<String, dynamic> map = await ConfigReader.readOnlineJson(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test_map.yaml');
    expect(map['websites']['YAML'], 'yaml.org');
    expect(map['languages'][0], 'Ruby');

    // list
    Map<String, dynamic> map2 = await ConfigReader.readOnlineJson(
        'https://raw.githubusercontent.com/nnnggel/config_reader/master/test/testfile/test_list.yaml');
    expect(map2['list'][0], 'Cat');
  });
}
