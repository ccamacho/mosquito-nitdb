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

def getKb(es,folder):
  for item in glob.glob(folder):
    with open(item, 'r') as stream:
      try:
        doc=yaml.load(stream)
        doc['name']=item.split('/')[2]
        doc["err"]= "<br />".join(doc["err"].split("\n"))
        doc["sol"]= "<br />".join(doc["sol"].split("\n"))
        pushKb(es,doc)
      except yaml.YAMLError as exc:
        print(exc)

def pushKb(es,doc):
  url=es+doc.get("name")
  headers = {'content-type': 'application/json'}
  response = requests.post(url, data=json.dumps(doc), headers=headers)
  #print response.content

def main(args):
  if len(sys.argv) > 1:
    es=str(sys.argv[1])
  else:
    print "ES server not provided."
    print "Usage: push.py <ES URL>/<index>"
    exit()

  shutil.rmtree("tripleo-kb","true")
  getGit("clone", "git://github.com/ccamacho/tripleo-kb.git", "-b", "master")
  getKb(es+"/nits/","tripleo-kb/nits/*.nit")
  getKb(es+"/tips/","tripleo-kb/tips/*.tip")
  shutil.rmtree("tripleo-kb","true")

if __name__ == '__main__':
    main(sys.argv)




