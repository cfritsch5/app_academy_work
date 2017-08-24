import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//Testing ------------
import allTodos from './reducers/selectors';
import {receiveTodo} from './actions/todo_actions';
//Testing ------------



document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root/>, root);



//Testing ------------
  window.allTodos = allTodos;
  window.store = configureStore();
  window.receiveTodo = receiveTodo;
 //Testing ------------

});
