//Protocols are way of describing what properties and methods something must have. We then tell Swift which types use that protocol - a process known as adopting or conforming to a protocol.
//For ex. we can write a function that accepts something with id property, but we dont care pricisely what type of data is used. We will start by creating an Identifiable protocol, which will require all comforming types to have an id string that can be read ("get") or written ("set"):

protocol Identifiable {
    var id: String {get set}
}
// we cant create instances of that protocol - its description of what we want, rather than something we can create and use directly. But we can create a struct that conforms to it:
struct User: Identifiable {
    var id: String
}

//Finally we will write a displayID() function that accepts any Identifiable object:

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//Protocol inheritance

//One protocol can inherit from another in a proccess known as protocol inheritance. Unlike with classes, we can inherit from multiple protocols at the same time before u add ur own customizations on top.
//We are going to define 3 protocols: Payable requires conforming types to implement a calculateWages() method, NeedsTraining requires conforming types to implement a study() method, and HasVacation requires conforming types to implement a takeVacation() method:

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTrainig {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

//Now we can create a single protocol Employee that brings them together in one protocol. We dont need to add anything on top, so we will just write open and close braces:

protocol Employee: Payable, NeedsTrainig, HasVacation {}
//Now we can make new types conform to that single protocol rather than each of the 3 individual ones.


//Extensions

//Extensions allow us to add methods to existing types, to make them to do things they were not originally designed to do.
//For example we could add an extension to the Int type so that it has squared() method that returns current number multiplied by itself:

extension Int {
    func squared() -> Int {
        return self * self
    }
}
//To try that out we will create an integer and see squared () method

var number = 5
number.squared()

//Swift doesnt let us add stored properties in extensions so we must use computed properties instead. For example, we could add a new isEven computed property to integers that returns true if holds even number:
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//Protocol Extensions
//Protocol let us describe what methods something should have, but dont provide the code inside. Extensions let us provide the code inside our methods, but only affect one data type - you cant add the method to lots of types at the same time.
//Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a spesific type like Int you extend a whole protocol so that all comforming types get ur changes.

//For example, here is an array and set containig some names:

let pythons = ["Eric", "Graham", "John","Garold","Tetra"]
let beatles = Set(["John","Paul","George"])
//Swifts arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}
//Both Array and Set will now have that method, so we can try it out:

pythons.summarize()
beatles.summarize()

//Protocol-oriented programming

//Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called "protocol-oriented programming" - crafting your code around protocols and protocol extensions.

//First, here is a protocol called Identifiable that requieres any conforming type to have an id property and an identify() method:

protocol Identifiable0 {
    var id: String {get set }
    func identify()
}
//We could make every conforming type write their own indetify() method, but protocol extensions allow us to provide a default:

extension  Identifiable0 {
    func identify() {
        print("My ID is \(id).")
    }
}
//Now when we create a type that conforms to Identifiable it gets identify() automatically

struct User1: Identifiable0 {
    var id: String
}
let twostraws = User1(id: "Twostarws")
twostraws.identify()
