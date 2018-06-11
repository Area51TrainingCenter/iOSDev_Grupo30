import UIKit

struct AutoStruct {
    var brand: String
}

var auto = AutoStruct(brand: "Audi")
auto.brand = "Toyota"
print(auto.brand)


struct Materia {
    
    let nombre: String
    let codigo: String?
    var grado: String? = nil
    var profesor: [String]? = nil
    
}
extension Materia {
    
    init(code: String, profesor: String) {
        self.nombre = code == "MAT" ? "Matemática" : "Lengua"
        self.codigo = code
        self.grado = nil
        self.profesor = [profesor]
    }
    
    static func sample() -> [Materia] {
        return []
    }
    
    static var sampleX: [Materia] {
        
        var materias = [Materia]()
        
        let m1 = Materia(code: "21", profesor: "Pepe")
        materias.append(m1)
        return materias
        
    }
    
}

let mat = Materia(nombre: "Matemática", codigo: "MAT", grado: "1", profesor: ["Ruben Dario"])
let lengua = Materia(code: "LE", profesor: "Martha Espinoza")

let materias = Materia.sample()
let x = Materia.sampleX

print(x)


struct Person {
    var name: String
}

var pepe = Person(name: "Pepe")
var susana = pepe
susana.name = "Susana"

print(pepe.name)
print(susana.name)



class Fruta {
    
    var name: String
    let color: UIColor
    let origen: String
    
    init(name: String, color: UIColor, origen: String) {
        self.name = name
        self.color = color
        self.origen = origen
    }
    
    convenience init(name: String) {
        self.init(name: name, color: UIColor.black, origen: "")
    }
}

let fresa = Fruta(name: "fresa")
var papaya = Fruta(name: "Papaya")

var melocoton = papaya
melocoton.name = "Melocoton"

print(papaya.name)
print(melocoton.name)

class Pago: NSObject  {
    
}


//-------------------------------------------/////
/*
 Codable
*/

let json = """
{
"countries": [
{
"code": 51,
"name": "Perú",
"currency" : {
"currency_id": "PEN",
"currency_name": null
}
},
{
"code": 52,
"name": "México",
"currency": {
"currency_id": "MXM",
"currency_name": null
}
},
{
"code": 54,
"name": "Chile",
"currency": {
"currency_id": "CH",
"currency_name": null
}
}
]
}
"""
let dataJ = json.data(using: .utf8)

struct Currency {
    let currencyId: String
    let currencyName: String
}
struct Country {
    let code: Int
    let name: String
    //let currency: Currency
    let currencyId: String
    let currencyName: String?
    let userId: Int = 0
    
    private enum CountryKeys: String, CodingKey {
        case code
        case name
        case currency
        case currencyId = "currency_id"
        case currencyName = "currency_name"
    }
}

extension Country: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CountryKeys.self)
        
        self.code = try container.decode(Int.self, forKey: .code)
        self.name = try container.decode(String.self, forKey: .name)
        
        let currencyKey = try container.nestedContainer(keyedBy: CountryKeys.self, forKey: .currency)
        
        self.currencyId = try currencyKey.decode(String.self, forKey: .currencyId)
        self.currencyName = try? currencyKey.decode(String.self, forKey: .currencyName)
    }
    
}

do {
    let countriesKey = try JSONDecoder().decode([String: [Country]].self, from: dataJ!)
    let countries = countriesKey["countries"]

}catch {
    print(error.localizedDescription)
}






