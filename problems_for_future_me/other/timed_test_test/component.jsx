import React from 'react';

export const FunctionalComponent = () => (<div></div>);


class ClassComponent extends React.Component {
  render () {
    return (
      <div>

      </div>
    );
  }
}

export default ClassComponent;

class ClassComponentWithProps extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      key: "state value"
    };
  }

  render () {
    // do extra logic for display here
    return (
      <div>
        <h1>Render Stuff Here</h1>
      </div>
    );
  }
}
