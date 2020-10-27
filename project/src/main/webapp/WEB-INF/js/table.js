$(function(){
    $("tr:nth-child(2n+1)").addClass("tr-even");

    $("tr:not(:first-child)").mouseover(function(){
        $(this).addClass("hover");
    });
    $("tr").mouseout(function(){
        $(this).removeClass("hover");
    });

    $("tr:nth-child(2n+1)").mouseover(function(){
        $(this).removeClass("tr-even")
        $(this).addClass("hover");
    });
    $("tr:nth-child(2n+1)").mouseout(function(){
        $(this).removeClass("hover");
        $(this).addClass("tr-even");
    });

    $(".page").mouseover(function(){
        $(this).addClass("hover");
    });

    $(".page").mouseout(function(){
        $(this).removeClass("hover");
    });
});
