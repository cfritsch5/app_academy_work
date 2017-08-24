import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//Testing ------------
import allTodos from './reducers/selectors';
import {receiveTodo} from './actions/todo_actions';
//Testing ------------



document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const root = document.getElementById('root');

  ReactDOM.render(<Root store={store}/>, root);



//Testing ------------
  window.allTodos = allTodos;

  window.receiveTodo = receiveTodo;
 //Testing ------------

});
