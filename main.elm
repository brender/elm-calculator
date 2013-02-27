(firstNumberField, input1) = Input.textField "First Number"

(secondNumberField, input2) = Input.textField "Second Number"

main = flow down [ firstNumberField, secondNumberField ]

