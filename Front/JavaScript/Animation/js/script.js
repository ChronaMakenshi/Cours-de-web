function move(direction) {

    var bloc = document.getElementById('bloc1');
    var position = bloc.getBoundingClientRect();
    if (direction == "left") {
        bloc.style.left = (position.x - 10) + "px";
    } else if (direction == "right") {
        bloc.style.left = (position.x + 10) + "px";
    }
}

my_timer = setInterval(move_timer, 10);

function move_timer() {
    var bloc = document.getElementById('bloc2');
    var position = bloc.getBoundingClientRect();
    bloc.style.left = (position.x + 1) + "px";
}

function stop_timer(stop = true) {
    if (stop) {
        clearInterval(my_timer);
    } else {
        my_timer = setInterval(move_timer, 10);
    }

}