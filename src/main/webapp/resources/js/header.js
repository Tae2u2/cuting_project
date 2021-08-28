/**
 * 
 */

const mypageBox = document.querySelector('.mypageBox');
const mypageToggle = document.querySelector('.memberToggle');

mypageToggle.onclick = function(){
	mypageBox.classList.memberToggle('active');
}