## What is config_reader
A flutter library for reading config files online or offline.  
[github](https://github.com/nnnggel/config_reader)

## What format does config_reader support
[.properties](https://en.wikipedia.org/wiki/.properties) 
> readProperties  
> readOnlineProperties  

[.json](https://en.wikipedia.org/wiki/JSON)
> readJson  
> readOnlineJson

[.yaml](https://en.wikipedia.org/wiki/YAML)
> readYaml  
> readOnlineYaml

## Result type
All method will return a **MAP** for result. As json and yaml files are designed to support map or LIST as root, config_reader will add a root node for "list".
    
For example:    
json: 
```
[
  "Cat",
  "Dog",
  "Goldfish"
]
```
yaml:
```
- Cat
- Dog
- Goldfish
```
Will return:
```
{list: [Cat, Dog, Goldfish]}
```

## More case
see test/config_reader_test.dart
