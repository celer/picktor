import yaml
import board 
from basicstrategy import BasicStrategy
import sys

f = open("config.yml","r")

config = yaml.load(f.read())

bs = BasicStrategy(config)

bs.pickAndPlace("RaceLogger RevB","Test",sys.stdout)
