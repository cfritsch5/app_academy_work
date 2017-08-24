class Clock {
  constructor() {
    // this.time = Date().slice(16,24).split(":");
    let time =["20","59","55"];

    this.sec = parseInt(time[2]);
    this.min = parseInt(time[1]);
    this.hour = parseInt(time[0]);
    this.time = [ this.hour, this.min, this.sec]

    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  increment_time() {
    this.time[2]++;
    for(let i = 3 ; i > 0; i--){
      if(this.time[i] >= 60){
        console.log(this.time[i]);
        this.time[i] = this.time[i] - 60;
        console.log(this.time[i-1]);
        this.time[i-1] = this.time[i-1] + 1;
      }
    }
  }
  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let print = [];

    for(let i = 0 ; i < 3; i++){
      if(this.time[i] < 10){
        print.push("0"+ this.time[i])
      }else {
        print.push(this.time[i])
      }
    }
    console.log(print.join(":"));
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.increment_time()
    this.printTime();
  }
}

const clock = new Clock();
