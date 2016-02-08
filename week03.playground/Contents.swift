//: Playground - noun: a place where people can play

import UIKit
import Foundation


/*:
**Exercise:** You have a secret message to send. Write a playground that can encrypt strings with an alphabetical [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher). This cipher can ignore numbers, symbols, and whitespace. Add a shift variable to indicate how many places to shift.
>> **Example Output:**
* Decrypted: Nearly all men can stand adversity, but if you want to test a man's character, give him power
* Encrypted: arneyl nyy zra pna fgnaq nqirefvgl, ohg vs lbh jnag gb grfg n zna'f punenpgre, tvir uvz cbjre
>> **Constraints:**
* Use a `switch` statment
* Use a loop statement
*/

var message = "Nearly all men can stand adversity, but if you want to test a man's character, give him power."
var comprAlphabet = "abcdefghijklmnopqrstuvwxyz"
var msgKey : Int = 15

comprAlphabet.isEmpty


var encryptMessage = ""

for c in message.characters {
    if let index = comprAlphabet.lowercaseString.characters.indexOf(c) {
        var pos = comprAlphabet.startIndex.distanceTo(index)
        pos = pos + msgKey
        pos = pos % 26
        encryptMessage.append(comprAlphabet[comprAlphabet.startIndex.advancedBy(pos)])
    }
    else if let index = comprAlphabet.uppercaseString.characters.indexOf(c) {
        var pos = comprAlphabet.uppercaseString.startIndex.distanceTo(index)
        pos = pos + msgKey
        pos = pos % 26
        encryptMessage.append(comprAlphabet.uppercaseString[comprAlphabet.startIndex.advancedBy(pos)])
    }
    else {
        encryptMessage.append(c)
    }
}

print((encryptMessage))

// Decypher message
var cypherKey = -msgKey

var decypherMessage = ""

/*
 * At first my first attempt to use the negative key resulted in negative results for 
 * the modulus operation. The indexing into the negative values resulted in errors.
 * Decided to use a numerical approach.
 */
for c in encryptMessage.characters {
    /* lowercase scenarios */
    if let index = comprAlphabet.lowercaseString.characters.indexOf(c) {
        var pos = comprAlphabet.startIndex.distanceTo(index)
        pos = pos + cypherKey
        if pos < 0 {
            pos = 26 + pos
        }
        decypherMessage.append(comprAlphabet[comprAlphabet.startIndex.advancedBy(pos)])
    }
    /* uppercase */
    else if let index = comprAlphabet.uppercaseString.characters.indexOf(c) {
        var pos = comprAlphabet.uppercaseString.startIndex.distanceTo(index)
        pos = pos + cypherKey
        if pos < 0 {
            pos = 26 + pos
        }
        decypherMessage.append(comprAlphabet.uppercaseString[comprAlphabet.startIndex.advancedBy(pos)])
    }
    /* all the other characters */
    else {
        decypherMessage.append(c)
    }
    
}

print(decypherMessage)
