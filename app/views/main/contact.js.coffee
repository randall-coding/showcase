
##Called when clicking Contact link in menu bar

#open contact window
contact_window = $('div.contact_window')
contact_window.css('display','block')
$('textarea').textContent = ''

console.log 'async called'
