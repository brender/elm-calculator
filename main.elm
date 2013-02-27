import Maybe
import Graphics
import Input
import Signal

(firstNumberField, input1) = textField "First Number"
(secondNumberField, input2) = textField "Second Number"

input1Floats = signalStringToFloat input1
input1Strings = signalFloatToString input1Floats
textResultSignal = lift plainText input1Strings

-- Same as:
-- flow down [ firstNumberField, secondNumberField ]
numberFields = firstNumberField `above` secondNumberField

main = lift (above numberFields) textResultSignal

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