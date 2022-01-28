import json
import requests
import argparse


arg_parser = argparse.ArgumentParser(description="Token")
  
# adding an arguments 
arg_parser.add_argument('-t','--token',required=True ,type=str, help="Token value")
args = arg_parser.parse_args()
API_key=args.token
print(API_key)

url = 'https://www.virustotal.com/vtapi/v2/url/sca'
params = {'apikey': API_key, 'url':'ibm.com'}
response = requests.post(url, data=params)
print(response.status_code)
print(response.text)
#print(response.json())
