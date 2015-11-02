// var ws = new WebSocket(uri);
var scheme = "ws://";
var uri = scheme + window.document.location.host + "/";

newConnection(uri);

function newConnection (uri){
  ws = new WebSocket(uri);
  console.log("Woohoo New Connection!!")
  ws.onmessage = function(message){
    var data = JSON.parse(message.data);
    $("#chat-text").append("<div class='panel panel-default'><div class='panel-heading'>" + data.handle + "</div><div class='panel-body'>" + data.text + "</div></div>");
    $("#chat-text").stop().animate({
      scrollTop: $('#chat-text')[0].scrollHeight
    }, 800);
  };
}

$(function(){
    $("#testButton").on("click", function(event){
      newConnection(uri);
    });

    $("#input-form").on("submit", function(event) {
      if (typeof ws == 'undefined'){
        console.log("Not Connceted")
        event.preventDefault();
      }else{
        var handle = $("#chat_handle").val();
        var text   = $("#chat_text").val();
        ws.send(JSON.stringify({ handle: handle, text: text }));
        // // console.log(ws);
        // $("#chat_handle").val("");
        // $("#chat_text").val("");
      }
    });

    $("#d_btn").on("click", function(){
      console.log("DISCONNECT")
      ws.close();
      delete ws;
    })
  // });

});

    // add to database
