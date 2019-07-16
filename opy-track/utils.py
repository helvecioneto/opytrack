import os

def readData():
    path = './data/compressed'

    for file in os.listdir(path):
        print(file)