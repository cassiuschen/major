class Dropdown
	constructor: (@selector, @data, @text = "请选择") ->
		@self = $(@selector)
		@dataContainer = $("#{@selector}>.menu")
		@text = $("#{@selector}>.text")
		@__mountData @data
		$(@selector).dropdown
			on: 'hover'
			transition: 'fade up'
		return

	update: (params = {data: [], callback: (->)}) ->
		@__mountData params.data
		if params.callback
			params.callback.call()
		return
		

	__mountData : (data) ->
		@dataContainer.html()
		data = data || []
		if data.length > 0
			@self.removeClass 'disabled'
			for item in newData
				@dataContainer.append "<div class=\"item\" data-value=\"#{item.id}\">#{item.name}</div>"
		else
			@self.addClass 'disabled'
			@text.html '暂无数据'
		return




