%dw 2.0
output application/json
import isNumeric from dw::core::Strings

var lines = (payload splitBy '\n')

fun getFirstAndLastNumbers(list: Array) = list map (line) -> do {
    var numbers = line find(/\d/)
    var firstNumber = line[numbers[0][0]]
    var lastNumber = line[numbers[-1][0]]
    ---
    "$(firstNumber)$(lastNumber)"
}
var partOne = sum(getFirstAndLastNumbers(lines))

var partTwo = do {
    fun replaceStringWithNumber(a) = a
        replace "one" with 1
        replace 'two' with 2
        replace 'three' with 3
        replace 'four' with 4
        replace 'five' with 5
        replace 'six' with 6
        replace 'seven' with 7
        replace 'eight' with 8
        replace 'nine' with 9

    var replacedLines = lines map (line) -> line reduce ((item, acc = "") -> replaceStringWithNumber(acc ++ item))
    ---
    sum(getFirstAndLastNumbers(replacedLines))
}
---
{
    partOne: partOne,
    partTwo: partTwo
}





