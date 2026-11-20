# x = 10

# def hallo() : 
#     global x 
#     x = 23
#     return x;
# print(hallo())
# print(x)


# def add (l):
#     if len(l) == 1:
#         return l[0]
#     else:
#         return l[0] + add(l[1:])
    
# res = add([ 5, 4, 2 ,1 ])
# print(res)

def fibonacci (n) : 
    if n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)
    
print(fibonacci(7))