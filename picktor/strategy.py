class Strategy:
  def __init__(self,config):
    self.config=config

  def pickAndPlace(outputFile):
    "create all the necessary modules"
    "use the picker as an interator to get a list of parts"
    "for each board"
    "current board = this board"
    "pick a part"
    "place a part"

  def paste(outputFile):
    "create all the necessary modules"
    "paste.generate(outputFile)"

  # General
  #   - Needs to be able to generate multiple files
  #   - Needs to be able to prompt for input
  # Load the conf file
  #   Load the requested drivers
  #   Feed the input files into the drivers
  # 
  #   - Paster
  #       Runs a paster to put paste on the board
  #         - Loads board mask
  #         - Loads boards extends
  #         - Generates gcode
  #
  #   - Board
  #     - Does it define one or more boards
  #     - Should be able to ask for the origin of a board
  #     
  #
  #
  #   - Placer
  #       Places part on board
  #          - Loads board mask
  #          - Loads part list
  #          - responsible for figuring out where to place the part
  #          - potentially validating the part was placed correct (vision)
  #
  #
  #   - Picker
  #       Picks the part off of the board
  #         - Provides a list of parts to place in order
  #         - Load parts list
  #         - Needs a model of how to pick parts
  #         - Must be able to request more part strips
  #         - responsible for figuring out the gcode to pick the part
  #         - potentially validating the part was picked up (vision)
  #         
  pass
 


