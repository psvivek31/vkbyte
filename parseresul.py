import json
f=open("result.json")
data=json.load(f)
for i in data["results"]["passed_checks"]:
    print(i)
    for k in i:
        print(k)
f.close()