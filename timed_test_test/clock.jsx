import React from 'react';

class Clock extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      startStop: false,
      timesUp: false,
      sec: 5
    };

    this.interval = null;

    this.tick = this.tick.bind(this);
    this.startStop = this.startStop.bind(this);
    this.reset = this.reset.bind(this);
    this.timesUP = this.timesUP.bind(this);
    this.printME = this.printME.bind(this);
  }

  componentDidMount() {
    this.setState({});
  }

  tick () {
    let s = this.state.sec;
    this.setState({
      sec: (s - 1)
    });
  }

  startStop(e) {
    const value = !this.state.startStop;
    this.setState({startStop: value});
    console.log(e);
    if (value){
      this.interval = setInterval(this.tick, 1000);
      // console.log("new interval");
    } else {
      clearInterval(this.interval);
      // console.log("clear interval");
    }
  }

  reset(){
    this.setState({sec: 60});
  }

  timesUP(){
    if (this.state.sec <= 0) {
      return true;
    } else {
      return false;
    }
  }

  printME(e) {
    e.preventDefault();
    console.log(e.currentTarget.value);
  }

  render () {
    let startStop = this.state.startStop ? "Stop" : "Start";
    // console.log(startStop);

    if (this.timesUP()) {
      return (<h1>Times Up</h1>);
    } else {
      return (
        <div>
          <h1>Render Stuff Here</h1>
          <form >
            <input type="text" defaultValue="minutes" size="2" maxLength="2"/>
            <input type="text" defaultValue="sec" size="2" maxLength="2"/>
            <button onClick={this.printME}/>
          </form>
          <button onClick={this.startStop}>{startStop}</button>
          <button onClick={this.reset}>Reset</button>
          <h1>{this.state.sec}</h1>
        </div>
      );
    }
  }
}
export default Clock;
