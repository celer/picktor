class Placer:
  def __init__(self,config):
    "init"
    self.boards=[]
    self.config=config

  def addBoard(self,board):
    "Will add a board and position it appropriately" 
    self.boards.append(board) 

  def listBoards(self):
    "Return a iterable list of boards"
    return self.boards

  def organizeBoards(self,stream):
    "This will very lamly try to place the boards"
    if len(self.boards)==0:
      raise Exception("At least one board must be specified")
    if len(self.boards)>1:
      raise Exception("Only one board is supported right now")
    for board in self.boards:
      stream.write("\n;-----------------\n;Place board "+board.board.name+" so that "+board.reference+" is at "+str(board.x)+","+str(board.y)) 
      stream.write("\n;Place board "+board.board.name+" so that "+board.second_reference.reference+" is at "+str(board.getBedX(board.second_reference.x))+","+str(board.getBedY(board.second_reference.y))+"\n") 


  def placePart(self,board,partPlacement,tape,stream):
    "Will place a particular part on a board and write the commands to the required stream"
    px = board.getBedX(partPlacement.x)
    py = board.getBedY(partPlacement.y)
    #FIXME must know rotation from the picker tape or assure the picker rotates the part back 
    # to a default orientation
    pr = partPlacement.rotation

    t = board.board.height+tape.tapeTemplate.partHeight;
    stream.write("\n;Rotate the part\n");
    r = pr/90;
    stream.write("G1 E"+str(r)+" E100\n")


    stream.write("\n;Put the part at "+partPlacement.reference+"\n")
    stream.write("G1 X"+str(px)+" Y"+str(py)+" Z20\n")
    stream.write("G1 X"+str(px)+" Y"+str(py)+" Z"+str(t)+"\n")
    stream.write("M42 P4 S0\n") 
    stream.write("G4 P200\n")
    stream.write("G1 X"+str(px)+" Y"+str(py)+" Z20\n")

