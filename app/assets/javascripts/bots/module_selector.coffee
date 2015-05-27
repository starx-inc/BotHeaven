class BotHeaven.Bots.ModuleSelector
  # Elements
  elements:
    addButton:      '.js-add-module'
    removeButton:   '.js-remove-module'
    usingList:      '.js-using-module'
    usableList:     '.js-usable-module'
    selectedValues: '.js-selected-values'

  # Initialize
  constructor: () ->
    @fetchElements()
    @assignEvents()

  # Fetch elements
  fetchElements: ->
    @$elements = new Object()
    for key, value of @elements
      @$elements[key] = $(value)

  # Assign Events
  assignEvents: ->
    @$elements.addButton.bind    'click', @onAdd.bind(@)
    @$elements.removeButton.bind 'click', @onRemove.bind(@)

  onAdd: ->
    @$elements.usingList.append(@$elements.usableList.find("option:selected"))
    @updateSelectedValues()

  onRemove: ->
    @$elements.usableList.append(@$elements.usingList.find("option:selected"))
    @updateSelectedValues()

  updateSelectedValues: ->
    @$elements.selectedValues.empty()
    for module_id in @$elements.usingList.find('option').map( -> $(this).val()).get()
      @$elements.selectedValues.append $('<input />').attr({
        name:  'bot[modules][]'
        type:  'hidden'
        value: module_id
      })
