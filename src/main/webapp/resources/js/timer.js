const startButton = document.getElementById("start-button");
const stopButton = document.getElementById("stop-button");
const elapsedTimeText = document.getElementsByClassName("elapsed-time-text")[0];

function displayStartButton() {
    startButton.style.display = "block";
    stopButton.style.display = "none";
}

function hideStartButton() {
    startButton.style.display = "none";
    stopButton.style.display = "block";
}

let elapsedTimeIntervalRef;
let startTime;
let elapsedTimeWhenPaused;

function startStopwatch() {
    setStartTime();

    elapsedTimeIntervalRef = setInterval(() => {
        elapsedTimeText.innerText = timeAndDateHandling.getElapsedTime(startTime);
    }, 1000);

    hideStartButton();
}


function setStartTime() {
    if (elapsedTimeWhenPaused) {
        startTime = new Date();

        startTime.setHours(startTime.getHours() - elapsedTimeWhenPaused.hours);
        startTime.setMinutes(startTime.getMinutes() - elapsedTimeWhenPaused.minutes);
        startTime.setSeconds(startTime.getSeconds() - elapsedTimeWhenPaused.seconds);
    } else {
        startTime = new Date();
    }
}

function stopStopwatch() {
    if (typeof elapsedTimeIntervalRef !== "undefined") {
        clearInterval(elapsedTimeIntervalRef);
        elapsedTimeIntervalRef = undefined;
    }

    storeElapsedTimeOnPause();
    displayStartButton();
}

function storeElapsedTimeOnPause() {
    const brokenDownElapsedTime = elapsedTimeText.innerText.split(":");

    const brokenDownElapsedTimeAsNumbers = brokenDownElapsedTime.map(numberAsString => parseInt(numberAsString));

    elapsedTimeWhenPaused = {
        hours: brokenDownElapsedTimeAsNumbers.length === 3 ? brokenDownElapsedTimeAsNumbers[0] : 0,
        minutes: brokenDownElapsedTimeAsNumbers.length === 3 ? brokenDownElapsedTimeAsNumbers[1] : brokenDownElapsedTimeAsNumbers[0],
        seconds: brokenDownElapsedTimeAsNumbers.length === 3 ? brokenDownElapsedTimeAsNumbers[2] : brokenDownElapsedTimeAsNumbers[1]
    }
}

function resetStopwatch() {
    if (typeof elapsedTimeIntervalRef !== "undefined") {
        clearInterval(elapsedTimeIntervalRef);
        elapsedTimeIntervalRef = undefined;
    }

    elapsedTimeWhenPaused = undefined
    displayStartButton();

    elapsedTimeText.innerText = "00:00";
}

const timeAndDateHandling = {
    getElapsedTime: function (startTime) {

        let endTime = new Date();
        let timeDiff = endTime.getTime() - startTime.getTime();

        timeDiff = timeDiff / 1000;

        let seconds = Math.floor(timeDiff % 60);
        let secondsAsString = seconds < 10 ? "0" + seconds : seconds + "";

        timeDiff = Math.floor(timeDiff / 60);

        let minutes = timeDiff % 60;
        let minutesAsString = minutes < 10 ? "0" + minutes : minutes + "";

        timeDiff = Math.floor(timeDiff / 60);

        let hours = timeDiff % 24;

        timeDiff = Math.floor(timeDiff / 24);

        let days = timeDiff;

        let totalHours = hours + (days * 24); // add days to hours
        let totalHoursAsString = totalHours < 10 ? "0" + totalHours : totalHours + "";

        if (totalHoursAsString === "00") {
            return minutesAsString + ":" + secondsAsString;
        } else {
            return totalHoursAsString + ":" + minutesAsString + ":" + secondsAsString;
        }
    }
}