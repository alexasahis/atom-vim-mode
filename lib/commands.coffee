_ = require 'underscore-plus'

class Command
  constructor: (@editor, @vimState) ->
  isComplete: -> true
  isRecordable: -> false

class Substitute extends Command
  execute: (count=1) ->
    _.times count, =>
      @editor.selectRight()
    @editor.delete()
    @vimState.activateInsertMode()

class SubstituteLine extends Command
  execute: (count=1) ->
    @editor.moveCursorToBeginningOfLine()
    _.times count, =>
      @editor.selectDown()
    @editor.delete()
    @editor.insertNewline()
    @editor.moveCursorUp()
    @vimState.activateInsertMode()

module.exports = { Substitute, SubstituteLine }
