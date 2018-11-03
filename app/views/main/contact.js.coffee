
##Called when clicking Contact link in menu bar

#open contact window
$('textarea').textContent = ''
contact_window = $('div.contact_window')
contact_window.css('display','block')

#set up screen div / blocker
$('div.mask').css('display','block')
console.log 'async called'
