-- elm-server

import Maybe
import Graphics
import Input
import Signal

(firstNumberField, input1) = textField "First Number"
(secondNumberField, input2) = textField "Second Number"

(operatorDropDown, selectedOperator) = dropDown [ ("+", (+)), ("-", (-)), ("•", (*)), ("÷", (/)) ]

-- Input float signals
input1Floats = signalStringToFloat input1
input2Floats = signalStringToFloat input2

-- Result signals
numberResults = selectedOperator ~ input1Floats ~ input2Floats
input1Plus2Strings = signalFloatToString numberResults
textResultSignal = lift plainText input1Plus2Strings

-- Same as:
-- flow down [ firstNumberField, secondNumberField ]
fields = flow right [ firstNumberField, operatorDropDown, secondNumberField ]

main = lift (above fields) textResultSignal

-- Signal Float -> Signal String
signalFloatToString sf = lift show sf

-- Signal String -> Signal Float
signalStringToFloat ss = lift stringToFloat ss

-- String -> Float
stringToFloat s = maybe 0 id (readFloat s)

----     Float -> (Float -> Float) -> Maybe Float   -> Float
--maybe    0   ->    doNothing     -> (readFloat s) -> …

--plusOne x = x + 1
--
--maybe 2 plusOne (Just 5) -> 6
--maybe 2 plusOne Nothing -> 2