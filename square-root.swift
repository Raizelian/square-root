enum squareRootError: Error {
  case noRoot, outOfBounds
}

func squareRoot (_ number: Int) throws -> Int {

  if number >= 1 && number <= 10000 {

    var temp = 1
    while temp <= number && (temp * temp) != number {
//      print("DEBUG : Trying", temp)
        temp += 1
        continue
    }

    let tempRes = temp

    if (tempRes * tempRes) == number {
      let radix = tempRes
      return(radix)
    } else {
        throw squareRootError.noRoot
    }

  } else {
      throw squareRootError.outOfBounds
    }
}

var number = 10_000
// try with values such as 14, 64, 0 or anything > 10.000 to see different errors being thrown (or not)

do {
  let result = try squareRoot(number)
  print("The square root of \(number) is", result)
} catch squareRootError.noRoot {
  print("No root!")
} catch squareRootError.outOfBounds {
  print("Out of bounds!")
} catch {
  print("An error occurred.")
}
