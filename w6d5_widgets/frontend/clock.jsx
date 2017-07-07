import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interval);
  }

  tick() {
    let time = new Date();
    this.setState({time});
  }
  render() {
    return (
      <div>
        <h1>Clock</h1>
            {this.state.time.toString()}
      </div>
    );
  }
}

export default Clock;
