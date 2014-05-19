from strategy import Strategy
from board import Board
from part import PartPlacement
from board import BoardLocation
from placer import Placer
from part import TapeTemplate
from pprint import pprint 
from picker import Picker
from part import Tape
from job import Job
from job import JobStep

class BasicStrategy(Strategy):
  def __init__(self,config):
    Strategy.__init__(self,config)
    self.placer = Placer(config)
    self.picker = Picker(config)

  def pickAndPlace(self,jobName,stepName,stream):
    boards={}
    jobs={}
    tapes={}
    tapeTemplates={}

    if self.config['boards']:
      for board in self.config['boards']:
        newBoard = Board(self.config)
        if 'name' in board:
          newBoard.setName(board['name'])

        if 'placements' in board:
          newBoard.setPlacements(PartPlacement.readFile(board['placements']))
        else:
          print "No placement specified for board:",board['name']

        if 'height' in board:
          newBoard.height=board['height']; 
        
        boards[newBoard.name]=newBoard
    

      # Load up the tape templates
      for tapeTemplate in self.config['tapeTemplates']:
        template = TapeTemplate()
        
        if 'name' in tapeTemplate:
          template.name = tapeTemplate['name']
        else:
          raise Exception("Missing tape template name")
        
        
        for name in tapeTemplate:
          if hasattr(template,name):
            setattr(template,name,tapeTemplate[name])
      
        tapeTemplates[template.name]=template;

      # FIXME Should validate the tapetemplate here 
        
  
      for tape in self.config['tapes']:
        if not 'name' in tape:
          raise Exception("No name specified for tape")
        if not 'template' in tape:
          raise Exception("No template specified for tape")
        if not tape['template'] in tapeTemplates:
          raise Exception("Invalid tape template specified:",tape['template'])
       
        partTape = Tape()

        for name in tape:
          if hasattr(partTape,name):
            setattr(partTape,name,tape[name])

        partTape.tapeTemplate=tapeTemplates[tape['template']]

        tapes[partTape.name]=partTape


      for job in self.config['jobs']:
        j = Job()

        for name in job:
          if hasattr(j,name) and name!="steps" and name!="boards":
            setattr(j,name,job[name])

        for board in job['boards']:
          if not 'name' in board:
            raise Exception("Invalid board specified")
          if not board['name'] in boards:
            raise Exception("Invalid board name:"+board['name'])
          j.addBoard(boards[board['name']], board['reference'],board['x'],board['y'], board['second_reference'])
          
        for step in job['steps']:
          js = JobStep()
        
          for name in step:
            if hasattr(js,name):
              setattr(js,name,step[name])
          j.steps.append(js)

      jobs[j.name]=j

      ##################################

      #1 Get the current job and step

      if not jobName in jobs:
        raise Exception("Invalid job name:"+jobName)
      
      currentJob = jobs[jobName]    

      currentStep = next((step for step in currentJob.steps if step.name == stepName), None)

      #2 Setup the placer with the boards
 
      stream.write("G28\n")
      stream.write("M302\n")
      stream.write("M92 E400\n")
 
      for board in currentJob.boards:
        self.placer.addBoard(board)

      self.placer.organizeBoards(stream)

      #3 Setup the picker with the tapes

      for tape in currentStep.tapes:
        self.picker.addTape(tapes[tape])

      self.picker.organizeTapes(stream)

      self.picker.generatePlacements(self.placer.boards)

      while True:
        pn = self.picker.pickPart(stream);
        if None==pn:
          break
        self.placer.placePart(pn.board,pn.placement,pn.tape,stream);

      
