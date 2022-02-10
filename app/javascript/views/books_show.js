
let counter = document.getElementById("counter_on_book_page");
let available_book = document.getElementById("available_book");

document.getElementById("counter_plus").addEventListener("click", function PlusOne() {
    if(counter.value < available_book.innerText) {
        counter.value ++;
    }
});
document.getElementById("counter_minus").addEventListener("click", function MinusOne() {
    if(counter.value > 1) {
        counter.value --;
    }
});
