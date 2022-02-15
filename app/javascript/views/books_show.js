
const counter = document.getElementById("counter_on_book_page");
const available_book = document.getElementById("available_book");
const counter_plus = document.getElementById("counter_plus")
const counter_minus = document.getElementById("counter_minus")

counter_plus && counter_plus.addEventListener("click", function PlusOne() {
    if(counter.value < parseInt(available_book.innerText)) {
        counter.value ++;
    }
});
counter_minus && counter_minus.addEventListener("click", function MinusOne() {
    if(counter.value > 1) {
        counter.value --;
    }
});
