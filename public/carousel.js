var slideIndex = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
console.log(slideIndex.length)
var slideId = ["sliders1", "sliders2", "sliders3", "sliders4", "sliders5", "sliders6", "sliders7", "sliders8", "sliders9", "sliders10", "sliders11", "sliders12", "sliders13", "sliders14", "sliders15", "sliders16", "sliders17", "sliders18", "sliders19", "sliders20"]
showSlides(1, 0);
showSlides(1, 1);
showSlides(1, 2);
showSlides(1, 3);
showSlides(1, 4);
//NEXT STEP => AUTOMATE THIS PROCESS TO ADD ON BUTTON-CLICK
showSlides(1, 5);
showSlides(1, 6);
showSlides(1, 7);
showSlides(1, 8);
showSlides(1, 9);
showSlides(1, 10);
showSlides(1, 11);
showSlides(1, 12);
showSlides(1, 13);
showSlides(1, 14);
showSlides(1, 15);
showSlides(1, 16);
showSlides(1, 17);
showSlides(1, 18);
showSlides(1, 19);

function plusSlides(n, no) {
    showSlides(slideIndex[no] += n, no);
  }
  
function showSlides(n, no) {
    var i;
    var x = document.getElementsByClassName(slideId[no]);
    if (n > x.length) {slideIndex[no] = 1}    
    if (n < 1) {slideIndex[no] = x.length}
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    console.log(slideIndex[no])
    x[slideIndex[no]-1].style.display = "block";  
}