// Trailing closure syntax is common in Swift.

//Using Closures as parameters  when they accept parameters

//This is where closure can start to be read a bit like line noise: a closure u pass into a function can also accept its own parameters.
//We have been using () -> Void to mean "accept no parameters and returns nothing", but we can go ahead and fill the () with types of any parameters that closure should accept.
// To demonstrate this we can write a travel() function that accepts a closure as its only parameter that your closure in  turn accepts a string

func travel2 (action:(String)-> Void) {
    print("We just coming out")
    action("Istanbul")
    print("Cool, we arrived")
}

travel2 { (place: String) in
    print("I am going to \(place) in my car")
    }

//Closures with return values
//We can replace that Void with any type of data to force the closure to return a value.
//F.e We can create travel () function that accepts a closure as its only parameter, and that closure in turn accepts a string and returns a string

func travel3(action: (String) -> String) {
    print("We just heading out")
    let description = action("London")
    print(description)
    print("We arrived")
}
travel3 { (place: String) -> String in
    return "I am going to \(place) in my car"
    
}
//Shorthand parameter names
//We just made a travel() function. It accepts one parameter, which is closure that itself accepts one parameter and returns a string. That closure is then run between two print() calls.
func travel4(action: (String) -> String) {
    print("We just heading out")
    let description1 = action("London")
    print(description1)
    print("We arrived")
}
// We can call travel() using something like this
travel4 { (place: String) -> String in
    return "I am going to \(place) in my car"
    }
//However Swift knows that its return type is String so we can remove this
travel4 { place -> String in
    return "I am going to \(place) in my car"
    }
// Its also knows the closure must return a string, so we can remove that:

travel4 { place in
    return "I am going to \(place)in my car"
    }
// As the closure only has one line of code that must be the one that returns the value, so Swift let us to remove the return keyword also:
travel4  { place in
    "I am going to \(place) in my car"
    }
// Swift has a shorthand syntax that let us to go even shorter.
//Rather than writing place in we can let Swift provide automatic  names for names of the closures parameters.
// These are named with dollar sign, then number counting from 0

travel4 {
    "I am going to \($0) in my car "
    }

//Closures with multiple parameters
// We will create another closure example by using two parameters

//This time our travel() function will require a closure that specifies someone is traveling to, and speed they are going. This means we need to use (String, Int) -> String for parameters

func travel6(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel6 {
    "I'm going to \($0) at \($1) miles per hour."
}

//Returning closures
// In the same way that we can pass a closure to a function, we can get closurs from a function too.
// The syntax is a lil bit confusing a first, cause it uses -> twic: Ones to specify ur functions retunr value and second time to specify ur closure return value.
// To try this we are going to write a travel() function that accepts no parameter, but returns a closure. The closure that gets returned must be alled with a string, and will return nothing.

func travel() -> (String) -> Void {
    return {
        print("I am going to \($0)")
    }
}

// Now we can call function to get back that closure, then call it as a function:
let result = travel()
result("London")
//Capturing values

//If you use any external values inside ur closure , Swift captures them - stores them alongside the closure, so they can be modified even they dont exist anymore.

// Right now we have travel() function that returns a closure and the returned closure accepts a string as its only parameter and returns nothing:
func travel2() -> (String) -> Void {
    return {
        print("I am going to \($0)")
    }
}
//Closure capturing happens if we create values in travel() that get used inside a closure.
//For ex. we can track how many times closure is called:


func travel3() -> (String) -> Void {
    var counter = 1
   return {
        print("\(counter).I am going to \($0)")
        counter += 1
    }
}
 let result2 = travel3()
 result2("Tashkent")
