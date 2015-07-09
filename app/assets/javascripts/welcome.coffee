# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  a = 0
  user = 0
  comp = 0
  ties = 0
  winningNums = []

  $('td').click ->
    if $(this).data('checked') is 'X' or $(this).data('checked') is 'O'
      alert('Try another square, idiot')
    else
      $(this).html('X')
      $(this).data('checked', 'X')
      setTimeout(computerGoes,500)
      a += 1;
      checkWinner()

  computerGoes = ->
    compy = Math.floor(Math.random() * 9 + 1)
    while $('td[data-square=' + compy + ']').data('checked') == 'X' or $('td[data-square=' + compy + ']').data('checked') == 'O'
      compy = Math.floor(Math.random() * 9 + 1)
      console.log compy

    $("td[data-square=" + compy + "]").html('O')
    $("td[data-square=" + compy + "]").data('checked', 'O')
    a += 1;
    checkWinner()



  checkWinner = ->

    if $("td[data-square='1']").data('checked') is 'X' and $("td[data-square='2']").data('checked') is 'X' and $("td[data-square='3']").data('checked') is 'X'
      endGame('X', 1, 2, 3)
    if $("td[data-square='4']").data('checked') is 'X' and $("td[data-square='5']").data('checked') is 'X' and $("td[data-square='6']").data('checked') is 'X'
      endGame('X', 4, 5, 6)
    if $("td[data-square='7']").data('checked') is 'X' and $("td[data-square='8']").data('checked') is 'X' and $("td[data-square='9']").data('checked') is 'X'
      endGame('X', 7, 8 , 9)
    if $("td[data-square='1']").data('checked') is 'X' and $("td[data-square='4']").data('checked') is 'X' and $("td[data-square='7']").data('checked') is 'X'
      endGame('X', 1, 4, 7)
    if $("td[data-square='2']").data('checked') is 'X' and $("td[data-square='5']").data('checked') is 'X' and $("td[data-square='8']").data('checked') is 'X'
      endGame('X', 2, 5, 8)
    if $("td[data-square='3']").data('checked') is 'X' and $("td[data-square='6']").data('checked') is 'X' and $("td[data-square='9']").data('checked') is 'X'
      endGame('X', 3, 6, 9)
    if $("td[data-square='1']").data('checked') is 'X' and $("td[data-square='5']").data('checked') is 'X' and $("td[data-square='9']").data('checked') is 'X'
      endGame('X', 1, 5, 9)
    if $("td[data-square='3']").data('checked') is 'X' and $("td[data-square='5']").data('checked') is 'X' and $("td[data-square='7']").data('checked') is 'X'
      endGame('X', 3, 5, 7)


    if $("td[data-square='1']").data('checked') is 'O' and $("td[data-square='2']").data('checked') is 'O' and $("td[data-square='3']").data('checked') is 'O'
      endGame('O', 1, 2, 3)
    if $("td[data-square='4']").data('checked') is 'O' and $("td[data-square='5']").data('checked') is 'O' and $("td[data-square='6']").data('checked') is 'O'
      endGame('O', 4, 5, 6)
    if $("td[data-square='7']").data('checked') is 'O' and $("td[data-square='8']").data('checked') is 'O' and $("td[data-square='9']").data('checked') is 'O'
      endGame('O', 7, 8, 9)
    if $("td[data-square='1']").data('checked') is 'O' and $("td[data-square='4']").data('checked') is 'O' and $("td[data-square='7']").data('checked') is 'O'
      endGame('O', 1, 4, 7)
    if $("td[data-square='2']").data('checked') is 'O' and $("td[data-square='5']").data('checked') is 'O' and $("td[data-square='8']").data('checked') is 'O'
      endGame('O', 2, 5, 8)
    if $("td[data-square='3']").data('checked') is 'O' and $("td[data-square='6']").data('checked') is 'O' and $("td[data-square='9']").data('checked') is 'O'
      endGame('O', 3, 6, 9)
    if $("td[data-square='1']").data('checked') is 'O' and $("td[data-square='5']").data('checked') is 'O' and $("td[data-square='9']").data('checked') is 'O'
      endGame('O', 1, 5, 9)
    if $("td[data-square='3']").data('checked') is 'O' and $("td[data-square='5']").data('checked') is 'O' and $("td[data-square='7']").data('checked') is 'O'
      endGame('O', 3, 5, 7)
    if a is 9
      $('td').css('background-color', 'red')
      endGame('Nobody')

  endGame =(winner, num1, num2, num3) ->
    $("td[data-square=" + num1 + "]").css('background-color', 'green')
    $("td[data-square=" + num2 + "]").css('background-color', 'green')
    $("td[data-square=" + num3 + "]").css('background-color', 'green')

    alert(winner + ' wins')
    $('td').html('')
    $('td').data('checked', '')
    $("td").css('background-color', 'white')
    a = 0
    if winner is 'X'
      user += 1
      $('.user-wins').html('User Wins: ' + user)
    else if winner is 'O'
      comp += 1
      $('.comp-wins').html('Computer Wins: ' + comp)
    else
      ties += 1
      $('.ties').html('Ties: ' + ties)
