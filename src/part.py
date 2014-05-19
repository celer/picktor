import re


class PartPlacement:
  # Ex: C102, 10nF, SMT805, 10,20, 90, Front
  def __init__(self,reference,value,package,posX,posY,rotation,side):
      self.reference=reference
      self.value=value
      self.package=package
      self.x=float(posX)
      self.y=float(posY)
      self.rotation=float(rotation)
      self.side=side;

  def getX():
    return self.x

  def getY():
    return self.y

  def getRotation():
    return self.rotation

  @staticmethod
  def readFile(filename):
    parts=[]
    for line in open(filename,"r"):
      line = re.sub(r'#.*$', "", line).strip()
      part = re.split("\s+",line)
      if len(part)==7:
        parts.append(PartPlacement(part[0],part[1],part[2],part[3],part[4],part[5],part[6]))
    return parts;


class TapeTemplate:
    def __init__(self):
      self.name=""
      self.package=""
      self.tapeWidth=0
      self.holeDiameter=0
      self.holeToEdge=0
      self.totalHeight=0
      self.partToEdge=0
      self.partHeight=0
      self.partLength=0
      self.partWidth=0
      self.partDistance=0
      self.partRotation=0
      self.pickupHeight=0


class Tape:
    def __init__(self):
      self.origin_x=0;
      self.origin_y=0;
      self.name=None
      self.value=None
      self.tapeTemplate=None
      self.type=None
      self.numberOfParts=0
      self.currentPart=0

    






