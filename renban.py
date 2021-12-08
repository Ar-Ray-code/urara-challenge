
# -*- coding: utf-8 -*-
## e.g $ python3 renban.py folder1 folder2 folder3 ...
import glob
import sys
import shutil
import os

##Default --------------
output_folder = "a/"
extension = ".png"
digit = 5
##-------------------------

## Info
files = []
print("Folders-------------")
for i in range(len(sys.argv)-1):
  print(sys.argv[i+1])
  files.extend(glob.glob(sys.argv[i+1] + "*" + extension))
print ("---------------------")
print ("Total number of files")
print (len(files))

## A question about save folder
folder_name = input("Where do you want to save your files?(default:a/):")
if(len(folder_name) == 0):
  folder_name = output_folder
elif(folder_name[-1] == "/"):
  pass
else:
  folder_name += "/"
ans_again = 1

## A question about extension
extension_name = input("What is the extension to handle?(default:png):")
if(len(extension_name) == 0):
  extension_name = extension
elif(extension_name[0] == "."):
  pass
else:
  extension_name = "." + extension_name

## if the folder already exists
ans_again = 1
if(os.path.isdir(output_folder)):
  print("This folder already exists.")
  while(ans_again):
    ans = input("Would you like to delete it and make it?(y/n):")
    if(ans == "y"):
      shutil.rmtree(output_folder)
      ans_again = 0
    elif(ans == "n"):
      ans_again = 0
os.makedirs(output_folder, exist_ok=True)

## Copy file--------------------------------------------------
i = 0
for f in files:
  shutil.copy2(f, output_folder + str(i).zfill(digit)+ extension)
  i += 1
## -----------------------------------------------------------
print("Successfully copied and renamed files")