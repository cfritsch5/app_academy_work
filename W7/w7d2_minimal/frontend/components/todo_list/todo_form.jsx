import React from 'react';
import uniqueId from '../../util/uniqueId';

class TodoForm extends React.Component {
  constructor() {
    super();
    this.state = {
      title: "",
      body: "",
      done: false
    };

    this.handleForm = this.handleForm.bind(this);
  }

  linkState(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleForm(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render () {

    return (
      <form className="todo-form" onSubmit={this.handleForm}>
        <label>
          Title
          <input onChange={this.linkState('title')} value={this.state.title}/>
        </label>
        <label>Body
          <input onChange={this.linkState('body')} value={this.state.body}/>
        </label>
      <button className="new-todo">Create New Todo</button>
      </form>
    );
  }
}

export default TodoForm;
