import React from 'react';


export default class Weather extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      location: position
    };
  }

  position () {
    navigator.geolocation.getCurrentPosition((position) => {
    this.latitude = position.coords.latitude;
    this.longitude = position.coords.longitude;
    });
  }

  render() {
    <h1>this.latitude</h1>
    <h1>this.longitude</h1>
  }
}
