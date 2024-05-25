const myModal = document.getElementById('exampleModal')
const myInput = document.getElementById('Modal')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
});
document.addEventListener('DOMContentLoaded', (event) => {
    const showModal = "${showModal}";
    if (showModal === "true") {
        const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
        myModal.show();
    }
});
