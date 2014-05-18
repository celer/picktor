class PickerPlacement:
  def __init__(self,tape,board,placement):
    self.tape=tape
    self.board=board
    self.placement=placement

class Picker:
  def __init__(self,config):
    self.config=config
    self.tapeTemplates={}
    self.tapes=[];

  def addTape(self,tape):
    self.tapes.append(tape)

  def organizeTapes(self,stream):
    for tape in self.tapes:
      stream.write("\n;Please make sure the tape "+tape.name+":")
      stream.write("\n;\tHas the first item at "+str(tape.origin_x)+","+str(tape.origin_y))
      stream.write("\n;\tAnd has the last item at "+str(tape.origin_x+tape.numberOfParts*tape.tapeTemplate.partDistance)+","+str(tape.origin_y)+"\n")
 
  def generatePlacements(self,boards):
    self.placements=[]

    for tape in self.tapes:
      partsUsed=0
      for board in boards:
        for placement in board.board.placements:
          if  tape.value == placement.value and placement.package == tape.tapeTemplate.package:
            # This needs to do this for as many parts as the tape has on it ... 
            partsUsed+=1
            if(partsUsed > tape.numberOfParts):
              break
            self.placements.append(PickerPlacement(tape, board, placement))
     
  def pickPart(self,stream):
    if(len(self.placements)>0):
      part = self.placements.pop(0)

      # advance tape
      # take part 
      self.pickUpPart(part.tape,stream)

      return part
    else:
      return None

  def advanceTape(self,tape,stream):
    "this would advance the picker or tape"
    tape.currentPart=tape.currentPart+1      

  def pickUpPart(self,tape,stream):
    "pick up the part"
    # Move to where we thing the part is
    stream.write("\n; Pick up the part from "+tape.name+"\n");
    stream.write("G1 E0\n")
    stream.write("G1 X"+str(tape.origin_x+tape.currentPart*tape.tapeTemplate.partDistance)+" Y"+str(tape.origin_y)+" Z20 F1000\n")
    # Visit the parts surface
    stream.write("G1 X"+str(tape.origin_x+tape.currentPart*tape.tapeTemplate.partDistance)+" Y"+str(tape.origin_y)+" Z"+str(tape.tapeTemplate.partHeight)+" F200\n")
    # Turn on the vacuum
    stream.write("M42 P4 S255\n");
    # Dwell
    stream.write("G4 P200\n");
    # Left the part upwards
    stream.write("G1 X"+str(tape.origin_x+tape.currentPart*tape.tapeTemplate.partDistance)+" Y"+str(tape.origin_y)+" Z20 F1000\n")
    
    self.advanceTape(tape,stream)

