const nameModal = document.getElementById('nameModal')
const nameInput = document.getElementById('myInput')

nameModal.addEventListener('shown.bs.modal', () => {
	myInput.focus()
})