import json

with open("students.json") as fh:
     students = json.load(fh)          


filledurl="https://docs.google.com/forms/d/e/1FAIpQLScKyI2-Ny3_UZzZda02pp7kQNFZoNm8MEEj7AnWbyDdasWq9w/viewform?usp=pp_url&entry.1597823921=Francis+Bond&entry.2091970412=s000"


for sid in students:
     if students[sid]['class'] == '5UJ2':
          name =  students[sid]['name']
          url=f"https://docs.google.com/forms/d/e/1FAIpQLScKyI2-Ny3_UZzZda02pp7kQNFZoNm8MEEj7AnWbyDdasWq9w/viewform?usp=pp_url&entry.1597823921={name}&entry.2091970412={sid}"
          print(f"  <li>{sid}: <a href='{url}'>{name}</a>")
    
