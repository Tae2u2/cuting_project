
const step = document.querySelectorAll(".step");

const content=document.querySelectorAll(".about_qt-content");

function steps(panelIndex) {
  	content.forEach(function(node) {
		node.style.display = "none";
	});
	content[panelIndex].style.display = "block";
}
steps(0);

$(".step").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		})