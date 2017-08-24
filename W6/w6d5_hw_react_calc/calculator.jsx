import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      num1: "",
      num2: "",
      result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value): "";
    this.setState({num1});
  }
  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value): "";
    this.setState({num2});
  }

  add(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    console.log(this.state.num1);
    this.setState({result});
    // this.state.num1 = "";
    // this.state.num2 = "";
  }

  clear(e) {
    e.preventDefault();
    this.setState({
      num1: "",
      num2: "",
      result: 0
    });
  }

  render() {
    const {num1, num2, result} = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>
        <button onClick={this.add}>Add</button>
        <button onClick={this.clear}>Clear</button>
        <p>{console.log()}</p>
      </div>
    );
  }
}

export default Calculator;
