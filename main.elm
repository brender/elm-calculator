(firstNumberField, input) = Input.textField "First Number"

main = lift (above firstNumberField) inputAsText

inputAsText = lift (text . toText) input