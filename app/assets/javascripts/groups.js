/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/*/

$(document).ready(function () {
    $('.right').click(function () {
        var position = $('.containerT').position();
        var r=position.left-$(window).width()
        $('.containerT').animate({
            'left': ''+r+'px'
        });
    });    
    
    $('.left').click(function () {
        var position = $('.containerT').position();
        var l=position.left+$(window).width()
        if(l<=0)
        {
        $('.containerT').animate({
            'left': ''+l+'px'
        });
        }
    });    
});





//Here we are getting the number of the divs with class contentContainer inside the div container
var length = $('div .containerT').children('div .contentContainer').length;
//Here we are setting the % width depending on the number of the child divs
$(".containerT").width(length*100 +'%');