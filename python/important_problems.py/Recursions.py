n = int(input("Enter the value : "))

def  factorial(n):
    if n == 1:
        return 1
    else : 
        return n*factorial(n-1);
    
val = factorial(n)
        
print(val)