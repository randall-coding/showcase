##called after clicking submit on contact window

#close contact window
$('div.contact_window').css('display','none')
$('div.mask').css('display','none')
$('textarea').val('')
$('div.contact_window').find('textarea').text('')
$('div.contact_window').find('input[type="text"]').text('')
