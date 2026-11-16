# 1: write a programm to desplay it 
# 1
# 1 2
# 1 2 3
# 1 2 3 4

# for i in range(1,6) :     # Rows
#     for j in range(1,i+1):  # Columns
#         print(j, end=" ")
#     print()
    
# 2: write a programm to desplay it 
# 1
# 2 2
# 3 3 3
# 4 4 4 4
# 5 5 5 5 5

# for i in range(1,6):
#     for j in range(1, i+1):
#         print(i, end=' ');
#     print()

# 3: write a programm to desplay it 
# 1 1 1 1 1
# 2 2 2 2
# 3 3 3
# 4 4
# 5

# for i in range(1,6):
#     # for j in range(i,6): # this is one way
#     for j in range(6,i, -1) : # Recommanded way
#         print(i, end=' ');
#     print()

# 4: write a programm to desplay it 
#         1
#       2 1
#     3 2 1
#   4 3 2 1 
# 5 4 3 2 1

# for i in range(1,6):
#     # for j in range(6,i,-1) :  
#     #     print('.', end='');
#     # for k in range(1,j):
#     #     print(j, end='')
#     for j in range(5,i,-1) :  
#         print('.', end=' ');
#     for k in range(i):
#         print('*', end=' ')
#     print()

# 5: write a programm to desplay it 
# 1
# 2 1
# 3 2 1
# 4 3 2 1
# 5 4 3 2 1

# for i in range(1,6):
#     for j in range(i, 0, -1):
#         print(j, end=" ")
#     print()
    
# 6: write a programm to desplay it 
# *
# * *
# * * *
# * * * *
# * * * * *
# * * * *
# * * *
# * *
# *

# for i in range(1,6):
#     if i < 6:
#         for j in range(1,i+1):
#             print('*', end=" ")
#     print()

# for i in range(1,6):
#     for j in range(5,i,-1):
#         print('*', end=" ")
#     print()