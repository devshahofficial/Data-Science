# input string
input_string = 'abcdefgabc'

# using sets data type
for character in sorted(set(input_string)):
    print(f'{character}, {input_string.count(character)}')
