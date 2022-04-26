
//Swift let us design our own types in two ways, of which the most common ist called structures,or just structs. Structs can be given their own var and constants, and their own functions, then created and used however we want.
//Lets start with simple ex. We are goin to create a Sport struct that stores its name as a string variable inside a struct called properties, so this is a struct  with one property:

struct Sport0 {
    var name: String
}
//That defines its type , so now we can create and use instance of it:

var tennis = Sport0(name: "Tennis")
print(tennis.name)

//We made both name and tennis variable, so we can change them just like regular variables:

tennis.name = "Lawn tennis"
//Properties can have default values just like regular vars, and u can usually rely on Swifts type inference.

//Computed properties
// Earlier we just created a Sport structure. That has a name property that stores String. These are called stored properties, because Swift has different kind of property called a computed property - a property that runs a code to figure out its value.
//We are going to add another stored property to the Sport struct, then a computed property. Here is the how that looks:

struct Sport {
    var name: String
    var isOlympic: Bool
    
    var olympicStatus: String {
        if isOlympic {
            return ("\(name) is an Olympic sport")
        } else {
            return ("\(name ) is not an Olympic")
        }
    }
}
 // As we can see, olympic Status looks like a regular String, but it returns different values depending on their peoperties.
// We can try it out by creating new instance of Sport:

let chessBoxing = Sport(name: "Chessboxing", isOlympic: false)
print(chessBoxing.olympicStatus)

//Property observers let us run code before any property changes. To demonstrate this, we will write a Progress struct that tracks a task and a completion percentage:

struct Progress {
    var task: String
    var amount: Int
}
//
//Methods
//Structs can have functions inside them, and those functions can use the properties of the struct as they  need to. Functions inside the structs called methods, but the still use func keyword.
// We can demonstrate this with a City struct. This will have a population property that stores how many ppl are in the city plus a collectTaxes() method that returns the population count multiplied by 1000. Because the method belongs to City it can read current citys population property.

struct City {
    var population:Int
     
    func collectTaxes() -> Int  {
        return population * 1000
         }
}
let london = City(population: 9_000_000)
london.collectTaxes()

//Mutating methods
//If a struct has a vatriablbe  property cant be changed the struct is a constant, so all its properties are also constant regardless of how they were created.

//When u create struct Swift always create them as constant by default. if u want to change the properties u must specifically request that. using mutating keyword, like this.

struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()

//Properties and methods of strings
// We have used lots of strings so far, and it turns out they are structs they have their own methods and properties we can use to query an manipulate the string .
//First lets create a test string

let string = "You will read this message when u will be revisnig material and become iOS dev"
//We can read the number of characters in a string using its count property:
print(string.count)

//They have a hasPrefix() method that returns true if the string stars with spesific letters:
print(string.hasPrefix("You"))

//We can uppercase a string by calling its uppercased() method:

print(string.uppercased())

//And we can even have Swift sort the letters of the string into an array:

print(string.sorted())

//Properties and methods of arrays
//Arrays are also structs, which means they have too their own methods and properties we can use to query and manipulate the array.
//Here is the simpple Array to get us started:
var toys = ["Horse"]
//We can read the number of item in an array using its count property
print(toys.count)

//If we want add item, use the append() method like this:
toys.append("Car")
//If we want locate any item inside array using its firstIndex() method like this:
toys.firstIndex(of: "Car")
//It will return 1 because array counts from 0.
//Just like with strings, we can have Swift sort the items of the array alphabetically:

print(toys.sorted())

//Finally if we want remove an item, we will use the remove() method like this:

toys.remove(at: 0)

print(toys)

//Initializers are special methods that provide different ways to create our struct. All struct come with one by default, called their memberweise initializer- this asks u to provide a value for each property when u create the struct.
//We can see this if we create User struct that has one property:

struct User {
    var username: String
}
//When we create one of those structs, we provide a username:
var username = User(username: "Goodboy")


//We can provide our own initializer to replace the default one. For example, we might want to create all new users as "Anonymous" and print message, like this:
struct User1 {
    var username:String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
//We dont write func before initializers, but we need to make sure all properties have a value before the init ends.
//Now our initializers accepts no parameter, we need to create the struct like this :
var user = User1()
user.username = "Goodboy"

//Self
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used. This self value is particularly useful when you create initializers that have the same parameter names as your property.

//For example, if you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.

//Here’s that in code:

struct Person1 {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
//As a performance optimization, Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time:

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
//We might use that FamilyTree struct as a property inside a Person struct, like this:

struct Person0 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person0(name: "Ed")
//But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:

lazy var familyTree = FamilyTree()
//So, if you want to see the “Creating family tree!” message, you need to access the property at least once:

ed.familyTree
