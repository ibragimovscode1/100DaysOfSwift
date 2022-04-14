import UIKit
// If you need spesific fixed collection of values  where each item has a special position or name, you should use a Tuple:
let address = (name:"Rahmetullah Ibragimov", city: "Istanbul", street:"Kizilirmak",house: "124")


// If you need unique type of values or you need to be able check a spesific item in there  extremely quickly you should use a Set:
let books:Set<String> = ["Zero to One","Think like a programmer","Why we sleep?"]



// if you need a collection of values that can contain duplicates with odered type you should use Arrays:
var classMates = ["David", "Ivan", "Ed"]

// Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can acces them using anything you want. The most common way of storing a dictionary data is using strings. For example there is a dictionary that stores height info of ppl

let heights = [              // if there is non existing value in dictionary u will get nil and if u dont want to get nil u can
    "Rahmetullah": 170,      // assign an default value
    "Shohmurod": 180,
    "Kenan": 185,
     ]

// Arrays, Dictionaries, and Sets are collections because they collect the values together in one place
// If you want to create an empty collection just write its  type followed by opening and closing parantheses ()
// F.e u can create an empty dictionary with strings for keys and values like this:

var teams = [String:String]()
// we can add values like this:
teams["Pauls"] = "Red"

//An empty Array of int  can be done like this:
var personsInClass = [Int]()

//But empty Set can be created a lil Bit differently :
let words = Set<String>()
var numbers = Set<Int>()


//Enumerations ussually called just enums are way of defining groups of related values in a way that makes the easier to use.
// for example if u wanna write code to represent suucces or failure with enum can be done like this

enum  Result {
    case Success
    case Failure
}
var result = Result.Success

//Associated value storing with enums that attached to spesific case. This lets u attach more additonal info to ur enums so they can represent more feature data

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case reciting(quantity: Int)
}

let talking = Activity.talking(topic: "Programming")
let running  = Activity.running(destination: "Istanbul Marathon")


//enum raw values sometimes u need to be able to assign values to enums so they have meaning this lets u create them dynamically and also use them in different ways
// F. e u can create  a Planet enum that stores integer values for each its cases:
enum Planet:Int {
    case mercury
    case venus
    case earth
    case mars
    
}
  // Swift will automatically assign each of those number starting form 0, and u can use numbers to create an instance of the appropriate enum case. F.e earth will be given number 2

let earth = Planet(rawValue: 2)

// if u want u can assign one more cases a spesific value and swift wiil generate the rest

enum Planet1:Int {
    case mercury = 1
    case venus
    case earth
    case mars
    
}
// so now earth will on 3 
