#!/bin/python

import subprocess
import yaml
import glob
import shutil
import requests
import json
import sys

def getGit(*args):
  return subprocess.check_call(['git'] + list(args))

def getNits(folder):
  for nit in glob.glob(folder):
    with open(nit, 'r') as stream:
      try:
        doc=yaml.load(stream)
        doc['name']=nit.split('/')[2]
        doc["err"]= "<br />".join(doc["err"].split("\n"))
        print doc['err']
        pushNit(doc)
      except yaml.YAMLError as exc:
        print(exc)

def pushNit(doc):
  url=es+doc.get("name")
  headers = {'content-type': 'application/json'}
  response = requests.post(url, data=json.dumps(doc), headers=headers)
  #print response.content


if len(sys.argv) > 1:
  es=str(sys.argv[1])
else:
  print "ES server not provided."
  print "Usage: push.py <ES URL>/<index>/<type>/"
  exit()



shutil.rmtree("tripleo-nit-db","true")
getGit("clone", "git://github.com/ccamacho/tripleo-nit-db.git", "-b", "master")
getNits("tripleo-nit-db/nits/*.nit")
shutil.rmtree("tripleo-nit-db","true")
