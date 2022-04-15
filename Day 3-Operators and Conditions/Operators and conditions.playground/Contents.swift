//Now we know all basic data types in Swift, we can start put them together using operators.
// Operators are those little mathematical symbols like + and -, and Swift huge range of em
// For example

let firstscore = 15
let secondscore = 5
// We can add substract using + and -:
let finalscore = firstscore + secondscore
print(finalscore)

// And we can multiply ad divide using * and /:
let product = firstscore * secondscore
let divided = firstscore / secondscore

// Swift has a special operator for calculating remainders after division: %.

let remainder = firstscore % 6

// Operator overloading
// Swift supports operator overloading, which is fancy way of saying that what an operator does depends on the values u use it with. F. e , + sums integers like this

let meaningOfProduct = 42
let doubleMeaningOfProduct = 42 + 42

//But + also joins strings like this:
let fakers = "Fakers gonna "
let action = fakers + "fake"

// We can even use + to join arrays, like this:

let firstHalf = ["Ramo", "Alper"]
let secondHalf = ["Kenan", "Oguz"]

let total = firstHalf + secondHalf

// Compound  assignment operators
// Swift has shorthand operaots that combine one oparator with an assignment (=), so we can change a variable in place.
// It is looks like this: +=; /=; *=; -=; they have an =on the end beacuse they assign the result back to the var.
// For example if someone scored 100 in exam but needs to be penalized 5 points we could do this:

var scoreInExam = 100
scoreInExam -= 5
// Simiraly we can add one string to another using +=:

var quote = "Every man is the the builder of his "

quote += "own future"

// Comparsion operators
// Swift has several operators that perform comparsion, and these work more or less like in math.

let startingScore = 7
let finishingScore = 6
// Equal operator
startingScore == finishingScore

//Not equal operator
startingScore != finishingScore

//Comparsion operators are just like in math
firstscore > finishingScore
startingScore >= finishingScore


//Conditions in Swift
// Conditions in Swift used writing if statements. You give a Swift condition and if that condition its true it will run code of ur case.
 // For exm. we will try out this with print() function.

let firstTeam = 25
let secondTeam = 29

if firstTeam + secondTeam > 55  {
    print("Its too much ppl here")
} else if firstTeam + secondTeam < 55 {
    print("Its few ppl here")
} else if firstTeam + secondTeam == 55 {
    print("Its only 55 ppl here")
} else {
    print ("I dunno how much")
}

//Combining conditions
//Swift has two special operators that let us combine conditions together they are && (pronounced "and") and || (pronounced "or")

let age1 = 12
let age2 = 21

// That print() call will only work if both conditions are over 18, which they are not in this case. In fact, Swift wont even bother checking the value of age2 because it can see that age1 already failed the test.

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}
 
// The alternative to && is ||, which evauluates as true if either item passes the test. For ex. we could print a message if either age is over 18:

if age1 > 18 || age2 > 18 {
    print("At least one of em greater than 18")
}
 // We can use  && and || more than once in a single condition, but dont make things over complicated.

//Ternary operator
//Swift has a rarely used ternary operator. It works with 3 values at once. It checks a condition specified in the first value and if its true returns the second value, but if its false returns the third value.

let score1 = 35
let score2 = 45

print(score1 == score2 ? "Scores are equal": "Scores are different")

//Same thing with normal condtions :
if score1 == score2 {
    print("Scores are ok")
} else {
    print("They are different")
}


//Switch statements
// Its often clearer to use a different construct known as switch case. Using this approach u write ur condition once, then list all possible outcomes and what should happen for each of em.

let work = "freshmen"
 
switch work {
case "new undergrad":
    print("Make a lil projects and start applying for a jobs")
case "last year of uni":
    print("Build a porfolio")
case "freshmen":
    print("Relax just study:)")
default:
    print("Dunno bro")
}

//Range operators
//Swift gives us two ways of making the ranges: the ..< and ... operators. The half open range operator, ..<, creates ranges up to but excluding the final value. and the closed range operator, ..., creates ranges up to including the final value.
//F.e the range 1..<5 contains the numbers 1,2,3,4. and the range 1...5 contains 1,2,3,4 and including 5.

//Ranges are helpful with switch blocks, cause we can use em for each of ur cases.
//F.e if someone took the exam we could print diff. messages depending on their score.

let score = 93
switch score {
case 80...95:
    print("Good")
case 92...95:
    print("Perfect")
case 30...60:
    print("Not Bad")
default:
    print("Its ok")
}
