import time

# starting the timer
start_time = time.time()


def longest_substring(string_1, string_2):
    operator = [[0] * (1 + len(string_2)) for a in range(1 + len(string_1))]
    longest, x_longest = 0, 0
    for i in range(1, 1 + len(string_1)):
        for j in range(1, 1 + len(string_1)):
            if string_1[i - 1] == string_2[j - 1]:
                operator[i][j] = operator[i - 1][j - 1] + 1
                if operator[i][j] > longest:
                    longest = operator[i][j]
                    x_longest = i
            else:
                operator[i][j] = 0
    return string_1[x_longest - longest: x_longest]


print(longest_substring('We are currently in lockdown',
                        'There was a lock on the door'))

print("--- %s seconds ---" % (time.time() - start_time))
