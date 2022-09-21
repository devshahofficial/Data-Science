# task is to solve a mathematical expression in form of a string
# here: : 35 + 3 * 2

# 35 + 3 * 2 in python is simply evaluated and outputted as 41

# To keep it simple and regex free, we can simply run eval operation on the string

input_string = '35 + 3 * 2'
print(eval(input_string))

# eval function interprets and executes a string as a code
# so it is risky to use eval if the system is to be built for the end users
