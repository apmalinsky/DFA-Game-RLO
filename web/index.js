var home = "index.html";


var pages = document.querySelectorAll(".page");

for (i = 0; i < pages.length; i++) {
    page = pages[i];

    page.addEventListener("click", function() { 
        clickedLink = this.innerText.toLowerCase();
        
        switch(clickedLink) {
            case "play":
                location.href = "play.html";
                break;
            case "home":
                location.href = home;
                break;
        }
    });
};




// var home = "../index.html";

// var currentState = null;

// window.onload = function() {
//     currentState = sessionStorage.getItem("reloading");

//     if (currentState !== null && currentState != "null") {
//         sessionStorage.removeItem("reloading");
//         loadContent(currentState); 
//     }
// }

// window.onbeforeunload = function() { 
//     window.setTimeout(function () { 
//         sessionStorage.setItem("reloading", currentState);
//     }, 0);

//     window.onbeforeunload = null; // necessary to prevent infinite loop, that kills your browser 
// }

// var contentElement = document.getElementById("content");
// var pages = document.querySelectorAll(".page");

for (i = 0; i < pages.length; i++) {
    nav = pages[i];

    nav.addEventListener("click", function() { 
        clickedLink = this.innerText.toLowerCase();
        loadContent("../pages/" + clickedLink + ".html");
    });
};

// function navHome(){
//     loadContent(home);
// }

// function loadContent(content) {
//     $("#content").fadeOut(function() {

//         $("#content").load(content, function(){
//             $("#content").fadeIn(function(){
//                 switch(content){
//                     case "../pages/play.html":
//                         playSetup();
//                         break;
//                     default:
//                         break;
//                 }
//             });
//         });    
//     });

//     currentState = content;
// }


// //PLAY

// function playSetup() {

//     console.log("playing game now")
//     // $("i").hover(function(){
//     //     if (this.getAttribute("brand") != null) {
//     //         switch(this.getAttribute("brand")) {
//     //             case "linkedin":
//     //                 brandColor = "#00a0dc";
//     //                 break;
//     //             case "github":
//     //                 brandColor = "#b19cd9";
//     //                 break;
//     //             case "instagram":
//     //                 brandColor = "#fcaf45";
//     //                 break;
//     //             case "medium":
//     //                 brandColor = "#00ab6c";
//     //                 break;
//     //             case "youtube":
//     //                 brandColor = "#ff0000";
//     //                 break;
//     //         }
//     //     }
//     //     else {
//     //         brandColor = "silver";
//     //     }

//     //     $(this).css("color", brandColor);
//     //     }, function(){
//     //     $(this).css("color", "white");
//     // });
// }

