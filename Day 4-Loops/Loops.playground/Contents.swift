//Swift has a few ways of writing loops, but their underlying mechanism is the same: run some code repedeatly until a condition evaluates as false.

// The most common loop in Swift is for loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out value and assign it to constant

// F.e here's a range of numbers:

let count = 1...10

// We can use for loop print each item like this

for  number in count {
    print("This is the number \(number)")
    }

// We can do the same for arrays:

let books = ["Click","Hack","Push"]

for  bestsellers in books {
    print("This is a top books:\(bestsellers)")
}

// If we dont use constants that for loops give u, we should use underscore _ instead so that Swift doesnt create needless values:


print("Players gonna play ")

for _ in 1...5 {
    print("play")
}

// While loops
// Second way of writing loops is using while: give it a condition to check, and its loop code will go around and around untiol the condition fails.

//F.e we could use while loop to simulate a child counting in a game hide and seek. We start at one and count up includong 20 while printing each number out and then after the loop print "Ready or not"
 
var number = 1
while  number <= 20 {
    print(number)
    number += 1
}
print("Ready or not")



// The third way is not commonly used. Its called repeat loop, and its identical to a while loop except the condition to check comes to end.
// So we could rewrite our hide and seek like this:

var number1 = 2

repeat {
    print("\(number1)")
    number1 += 1
} while number1 <= 20
    print("Ready or not")

// Because the condition comes at the end of the repeat loop the code inside the loop will always executed at least once, whereas while loops chechk their condition before their first run.

// F.e this print() function will never be run, because false is always false:

while false {
    print("False")
}
//Xcode will even warn u that print() line never will be executed

// On the other hand with repeat loop it will run once, cause repeat only fails the condition after the loop runs:
repeat {
     print("False")

} while false

// Exiting loops we can exit loop anytime using break keyword.
//F.e lets try it with regular while loop with case of countdown rocket launch:

var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}
print("Lift off")

//In this case the astronaut gets bored and decide launch early we can just skip the reminder: like this

var countDown1 = 10
while countDown1 >= 0 {
    print(countDown1)
    
    if countDown1 == 4 {
        print("Screw it, lets go ")
        break
    }
    countDown1 -= 1
    
}

// Exiting multiple loops
// If you put loop inside a loop its called nested loop, and its not uncommon to want break out both of the inner loop and the outer loop at the same time.
// F.e we could write some code to calculate the times tables from 1 through 10 like this:
for i in 1...10 {
    for j in 1...10 {
     let product = i * j
        print("\(i) * \(j) is \(product)")
        
    }
}
 
// if we wanted to exit part-way through it we need to do 2 things.
// First, we give the outside loop a label like this:

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is  a \(product)")
    }
}
//Second, add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time:

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("(\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("Its done")
             break outerLoop
        }
    }
}
// With regular break only inner loop would be exited - the outer loop would continue where it left off.

//Skipping items in loop
//If you want to skip the current item and continue to the next one, we should use continue instead.
// F.e we can write loop from 1 to 10, then use Swift's remainder operator to skip any numbers that odd.

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// Infinite loops
// Its common to use while loops to make infinite loops.All apps on our Iphone use infinite loops because they start runnig, then continually watch for events until u choose to quit em.
// To make infinite loop just use true as ur condition true is always true so the loop will repeat forever. Warning dont forget to exit ur loop otherwise it will never end.

// F. e we can use while true to print the music of John Cages,s piece 4'33 - its famous cause its complete silence of 4 min and 33 sec

var counter = 0

while true  {
    print("")
    counter += 1
    
    if counter == 273 {
        break
    }
}
