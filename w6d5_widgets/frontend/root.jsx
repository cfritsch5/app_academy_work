import React from 'react';
import Clock from './clock';
import Weather from './weather';
// const Root = () => <h1>Root</h1>;

class Root extends React.Component {
  render() {
    return (
      <div>
        <Clock/>
        <Weather />
      </div>
    );
  }
}

export default Root;
