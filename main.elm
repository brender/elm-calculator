import Maybe
import Graphics
import Input
import Signal

(firstNumberField, input1) = textField "First Number"
(secondNumberField, input2) = textField "Second Number"

input1Floats = signalStringToFloat input1
input1Strings = signalFloatToString input1Floats
result = lift plainText input1Strings
numberFields = above firstNumberField secondNumberField

main = lift (above numberFields) result

-- Signal Float -> Signal String
signalFloatToString s = lift show s

-- Signal String -> Signal Float
signalStringToFloat s = lift stringToFloat s

-- String -> Float
stringToFloat s = maybe 0 id (readFloat s)

----     Float -> (Float -> Float) -> Maybe Float   -> Float
--maybe    0   ->    doNothing     -> (readFloat s) -> …

--plusOne x = x + 1
--
--maybe 2 plusOne (Just 5) -> 6
--maybe 2 plusOne Nothing -> 2