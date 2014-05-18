from board import BoardLocation

class Job:
    def __init__(self):
      self.name=None
      self.boards=[]
      self.steps=[]

    def addBoard(self,board,reference,x,y,second_reference):
      self.boards.append(BoardLocation(board,reference,x,y,second_reference))

class JobStep:
    def __init__(self):
      self.name=None
      self.tapes=[]
