package src.tokenizer;

import haxe.Json;
import sys.FileSystem;
import sys.io.File;
import Sure.sure;

typedef ControlUnitsDictionary<T> = Array<T>;
typedef UnaryControlUnit = String;
typedef UnaryControlUnitsDictionary = ControlUnitsDictionary<String>;
typedef DictionaryName = String;
typedef UnbindedBinaryControlUnit = {open: String, close: String, dictionary: Array<DictionaryName>};
typedef UnbindedBinaryControlUnitsDictionary = ControlUnitsDictionary<UnbindedBinaryControlUnit>;

function loadUnaryDictionary(p: String): UnaryControlUnitsDictionary {
    sure(FileSystem.exists(p) == true);
    var parser = new json2object.JsonParser<UnaryControlUnitsDictionary>();
    parser.fromJson(File.getContent(p));
    sure(parser.errors.length == 0);
    return parser.value;
}