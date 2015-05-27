class StepControl
	constructor: ({selector: @selector, container: @container}) ->
		@self = $(@selector)
		@content = $(@container)
		@size = $("#{@selector} .step").length
		@active = $("#{@selector} .active.step")
		return

	nextStep: (html) ->
		@active.removeClass("active").addClass("completed").next().addClass("active") 
		@__mountContent html
		return

	getData: (url) ->
		@__getDataFromUrl url
		@__mountData @data
		
	__clearContent: ->
		@content.html()

	__mountContent: (data) ->
		@__clearContent()
		@content.html data

window.Step = StepControl