import json

student_data = {
    "name" : "Nazmul",
    "age" : 13,
    "marks" : 87
}

# json_formate = json.dumps(student_data)

# # Access the value of age from the json data
# oparations = json.loads(json_formate) # converts to object/dict again

# pritty = json.dumps(student_data, indent=4, separators=[',','='])


# Write student data into a file

f = open("student_data.json", 'w')
data = json.dumps(student_data, indent=4,  sort_keys=True)

f.write(data)
f.close()
# print(pritty)