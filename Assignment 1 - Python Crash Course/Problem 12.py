# calculate_nth_fibonnaci function is a recursive function that calculates the nth fibonacci number
def calculate_nth_fibonnaci(input_number):
    if input_number == 2:
        return 1
    elif input_number == 1:
        return 0
    else:
        return calculate_nth_fibonnaci(input_number - 1) + calculate_nth_fibonnaci(input_number - 2)
        # as the current fibonacci number is the sum of the 2 numbers that


print(calculate_nth_fibonnaci(23))
