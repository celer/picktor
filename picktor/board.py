class BoardLocation:
  def __init__(self,board,reference,x,y,second_reference):
    self.board=board
    self.reference=reference
    self.x=x
    self.y=y

    self.second_reference = second_reference
    self.ref_x = None
    self.ref_y = None

    for placement in self.board.placements:
      if placement.reference == self.reference:
        self.ref_x = placement.x
        self.ref_y = placement.y
      if placement.reference == self.second_reference:
        self.second_reference = placement

   
    if self.ref_x == None and self.ref_y == None:
      raise Exception("Unable to determine board location, reference: "+self.reference+" does not appear to in the board placements")
 

  
  def getBedX(self,x):
    return self.x+(x-self.ref_x)

  def getBedY(self,y):
    return self.y+(y-self.ref_y)


class Board:
  def __init__(self,config):
    ""

  def setName(self,name):
    self.name=name
  
  def setPlacements(self,placements):
    self.placements=placements
