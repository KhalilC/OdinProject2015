function drawBoard(squares){
    var $height = (100/squares) + "%";
    var $width = (100/squares) + "%"; 
  
    for(var i = 0; i < (squares*squares)+1; i++){ 
     $('.square').css('width', $width);
    $('.square').css('height', $height);  
    $('#board').append('<div class="square"></div>');
   
        
    }
}



$(document).ready(function(){
    $('#board').on('mouseenter', '.square', function(){
        var randomColorChange = '#'+(Math.random()*0xFFFFFF<<0).toString(16);
        $(this).css('background-color', randomColorChange);
    });
    $('.button').on('click', function() {
      $('.square').css('background-color', 'white');
        var $newBoard = parseInt(prompt('How many columns/rows'));
        $('.square').remove();
        drawBoard($newBoard);
    });
    
    
});