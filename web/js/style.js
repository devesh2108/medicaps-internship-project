'use strict'
var numb=$("#loop .list").length;
var limit = 4;
$("#loop .list:gt("+ (limit-1) +")").hide();
var totalpages=Math.round(numb/limit);
$(".pagination").append("<li class='current page-item active'><a class='page-link' href='javascript:void(0)'>"+ 1 +"</a></li>");
for(var i=2 ;i <= totalpages ;i++){
$(".pagination").append("<li class='current page-item'><a class='page-link' href='javascript:void(0)'>"+ i +"</a></li>");
}
$(".pagination").append("<li id='next' class='page-item'><a class='page-link' href='javascript:void(0)'>Next</a></li>")

$(".pagination li.current").on("click", function(){
    if($(this).hasClass("active")){
        return false;
    }
    else{
        var currentpage = $(this).index();
        $(".pagination li").removeClass("active");
        $(this).addClass("active");
        $("#loop .list").hide();
        
        var grandtotal= limit*currentpage;
        for(var i=grandtotal-limit;i<grandtotal;i++){
            $("#loop .list:eq("+ i +")").show();
        }
    }
    

});

$("#next").on("click", function(){
   var currentpage=$(".pagination li.active").index();
   if(currentpage == totalpages){
       return false;
   }
   else{
       currentpage++;
        $(".pagination li").removeClass("active");
        $("#loop .list").hide();
        
        var grandtotal= limit*currentpage;
        for(var i=grandtotal-limit;i<grandtotal;i++){
            $("#loop .list:eq("+ i +")").show();
        }
        $(".pagination li.current:eq("+ (currentpage-1) +")").addClass("active");
   }
});

$("#previous").on("click", function(){
   var currentpage=$(".pagination li.active").index();
   if(currentpage == 1){
       return false;
   }
   else{
       currentpage--;
        $(".pagination li").removeClass("active");
        $("#loop .list").hide();
        
        var grandtotal= limit*currentpage;
        for(var i=grandtotal-limit;i<grandtotal;i++){
            $("#loop .list:eq("+ i +")").show();
        }
        $(".pagination li.current:eq("+ (currentpage-1) +")").addClass("active");
   }
});

              
