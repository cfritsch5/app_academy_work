import React from 'react';

class Weather extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      position: null
    };

    this.pollweather = this.pollweather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.pollweather);
  }

  pollweather(position) {
      this.setState({position:[position.coords.latitude, position.coords.longitude] });
    }

  render(){
    return (
      <div>
        {this.state.position}
      </div>
    );
  }
}

export default Weather;
