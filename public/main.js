let taglines = document.getElementsByClassName("max-tagline");

if (taglines.length) {
  setTimeout(() => {
    taglines[0].classList.add("show");
  }, 500);
  
  setTimeout(() => {
    taglines[1].classList.add("show");
  }, 1250);
}

//FORMS 
var expanded = false;

function showCheckboxes() {
  console.log("Hello");
  var checkboxesVibes = document.getElementById("checkboxes-vibes");
  console.log(checkboxesVibes);
  if (!expanded) {
    checkboxesVibes.style.display = "block";
    expanded = true;
  } else {
    checkboxesVibes.style.display = "none";
    expanded = false;
  }
};

var expanded2 = false;

function showCheckboxes2() {
  console.log("Hello")
  var checkboxesTags = document.getElementById("checkboxes-tags");
  console.log(checkboxesTags);
  if (!expanded2) {
    checkboxesTags.style.display = "block";
    expanded2 = true;
  } else {
    checkboxesTags.style.display = "none";
    expanded2 = false;
  }
};