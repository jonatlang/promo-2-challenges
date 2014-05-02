# This class represents a menu action
# The idea is to have a MenuAction instance per action in our UI menu; each
# instance will have a title, the capabilities required to execute the action and
# a block to execute when the action is triggered.
#
class MenuAction
  attr_reader :title, :capabilities

  def initialize(title, capabilities, &block)
    @title = title
    @capabilities = [capabilities].flatten
    @action = block
  end

  # "Running" a menu action simply means calling the block that was given at
  # initialization with the given arguments
  def run(*args)
    @action.call(args)
  end
end
