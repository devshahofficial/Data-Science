# check_palindrome function checks for palindrome in a string
def check_palindrome(input_string):
    # reversing the array and matching the two strings
    reverse_input_string = input_string[::-1]

    # check point for string equivalence
    if input_string == reverse_input_string:
        return True
    return False


# check_symmetrical function checks for symmetrical in a string
def check_symmetrical(input_string):
    # only strings with even length can be symmetrical
    
    if len(input_string) % 2 == 0:
        # splitting strings in 2 halves and comparing the halves
        first_half_input_string = input_string[:int(len(input_string) / 2)]
        second_half_input_string = input_string[int(len(input_string) / 2):]

        if first_half_input_string == second_half_input_string:
            return True
    return False


# check_result function outputs whether a string is a palindrome, symmetric or 
def check_result(input_string):
    if check_palindrome(input_string):
        print('String is a Palindrome.')
    elif check_symmetrical(input_string):
        print('String is a Symmetrical.')
    else:
        print('String is not a Palindrome nor Symmetrical.')


test_string = 'malayalam'

print("String Entered: " + test_string + "\n")
check_result(test_string)
