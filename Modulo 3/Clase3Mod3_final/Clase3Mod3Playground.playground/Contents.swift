import UIKit


//NSSet - Set
/*
 - No tiene orden
 - No tiene valores nulos.
 - No permite valores duplicados
 */

var miarray: Array<String> = ["String"] // [String]
var miset: Set<String> = ["String"]
var midictionary: Dictionary<String, String> = ["": ""] // [String: String]


//Array
miarray[0] = "Nuevo string"
miarray.append("")
miarray.insert("", at: 0)

//Dictionary
midictionary["Key"] = ""

//Set
var setaArray = miset.sorted()
miset.insert("")
