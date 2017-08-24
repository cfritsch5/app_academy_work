import React from 'react';

class AutoComplete extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      inputVal: ""
    };
  }

  query(){
    
  }

  render () {
    for(let i in this.state.inputVal){
      <li>{}</li>
    }


    return (
      <div>
        <input></input>
        <ul>
          {}
        </ul>
      </div>
    );
  }
}

export default AutoComplete;
