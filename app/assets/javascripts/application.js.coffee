# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require modernizr
#= require semantic-ui
#= require nprogress
#= require nprogress-turbolinks
# require_tree .

NProgress.configure
  showSpinner: false
  ease: 'ease',
  speed: 500


window.base = 
	checkModalButtons : ->
		$('.modal-target').on 'click', ->
			target = $(this).data 'modal'
			$("##{target}")
				.modal('setting', 'transition', 'fade up')
				.modal('toggle')
	initDropdown : ->
		$('.dropdown').dropdown
			on: 'hover'
			transition: 'fade up'

	canCloseMessages: ->
		$('.message .close').on 'click', ->
	  		$(this).closest('.message').fadeOut()
	init: ->
		window.base.checkModalButtons()
		window.base.initDropdown()
		window.base.canCloseMessages()


$(document).on 'page:change', ->
  console.log 'init'
  window.base.init()

$(document).on 'page:load', ->
  console.log 'page:load'