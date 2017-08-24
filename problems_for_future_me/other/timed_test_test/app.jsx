import React from 'react';
import Clock from './clock';

class App extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      x: 0,
      y: 0,
      z: 0
    };

  }

  update(property) {
  return e => this.setState({
    [property]: e.target.value
  });
}

  render () {
    // do extra logic for display here
    const propsFromParent = this.props.toprop;
    return (
      <div>
        <input id="tset1" type="text" onChange={this.update} value={this.state}/>
      </div>
    );
  }
}

export default App;
