document.addEventListener("scroll", function () {
    var mesElements = document.getElementsByClassName("reduire");
    if (window.scrollY > 80) {
     
        for (var i = 0; i < mesElements.length; i++) {
            mesElements[i].classList.add("scroller");
        }
    }
    else {
        
        for (var i = 0; i < mesElements.length; i++) {
            mesElements[i].classList.remove("scroller");
        }
    }
 
});

/* menu */
var monMenu = document.getElementById("menu");
var submenu = document.querySelector(".submenu");
if (monMenu) {
    monMenu.addEventListener("click", function () {
        monMenu.classList.toggle('open');
    });

}


/*facture*/


document.addEventListener("load", imprimer);

function imprimer() {
    var printContents = document.getElementById("form1").innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = '<html><head> <link href="/css/font-awesome.css" rel="stylesheet"/><title></title></head><body>' + printContents + '</body>';
    window.print();
    document.body.innerHTML = originalContents;
}


