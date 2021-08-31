/**
 * 
 */

const inputs = document.querySelectorAll('.inputLog');


function focusFunc(){
	let parent = this.parentNode.parentNode;
	parent.classList.add('focus');
}

function blurFunc(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
	parent.classList.remove('focus');
	}
		
}
	

inputs.forEach(inputLog => {
	inputLog.addEventListener('focus', focusFunc);
	inputLog.addEventListener('blur', blurFunc);
});