//FORMS 
var expanded = false;

function showCheckboxes() {
  var checkboxesVibes = document.getElementById("checkboxes-vibes");
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
  var checkboxesTags = document.getElementById("checkboxes-tags");
  if (!expanded2) {
    checkboxesTags.style.display = "block";
    expanded2 = true;
  } else {
    checkboxesTags.style.display = "none";
    expanded2 = false;
  }
};

// document.body.addEventListener("click", event => {
//   var checkboxesVibes = document.getElementById("checkboxes-vibes");
//   if (expanded && checkboxesVibes.style.display == "block"){
//     checkboxesVibes.style.display = "none";
//     expanded = false;
//   }
// });

// document.body.addEventListener("click", event => {
//   var checkboxesTags = document.getElementById("checkboxes-tags");
//   if (expanded2 && checkboxesTags.style.display == "block"){
//     checkboxesTags.style.display = "none";
//     expanded = false;
//   }
// });