import React from 'react';


export default class Clock extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.intervalId.clearInterval();
  }

  tick() {
    this.setState({time: new Date()});
  }

  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    let date = this.state.time.toDateString();
    let dates = date.split(" ")

    hours = (hours < 10) ? `0${hours}` : hours;
    hours = (hours > 12) ? `${hours - 12}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return (
      <div>
        <h1>Bank Widgets</h1>
        <div className="time">
          {hours}:{minutes}:{seconds}
        </div>
        <div className="date">
          <span> {dates[0]}</span>
          <span> {dates[1]}</span>
          <span> {dates[2]}</span>
          <span> {dates[3]}</span>
        </div>
      </div>
    );
  }
}
