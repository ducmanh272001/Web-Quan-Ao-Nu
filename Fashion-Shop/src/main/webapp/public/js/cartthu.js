/**
 * 
 */
 
 
 $('.search-btn a').click(function(ev){
    ev.preventDefault()
     $('.nenmosearch').addClass('hiennenmosearch')
     $('body').addClass('overhidden')
})

$('.nenmosearch span').click(function(){
    $('.nenmosearch').removeClass('hiennenmosearch')
    $('body').removeClass('overhidden')
})


var dangnhap = document.getElementById('formcart')


function myFuntion(){
    document.getElementById('formcart').submit();
}