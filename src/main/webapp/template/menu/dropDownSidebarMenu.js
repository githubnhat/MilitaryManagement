let arrow = document.querySelectorAll(".arrow");
for (var index = 0; index < arrow.length; index++) {
    arrow[index].addEventListener("click", (e) =>{
	let showedMenu = document.querySelectorAll(".showMenu");
	let arrowParent = e.target.parentElement.parentElement.parentElement;
	for (var i = 0; i < showedMenu.length; i++) {
		if(arrowParent!=showedMenu[i]){
			showedMenu[i].classList.remove("showMenu");
		}
	}
        arrowParent.classList.toggle("showMenu");
    });
}

let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close-dropdown");
});

	