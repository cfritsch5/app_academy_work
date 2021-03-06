import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <NavLink exact to='/red' >red only</NavLink>
        <NavLink to='/red/orange' >Add orange</NavLink>

        <h2 className="red"></h2>
        <Route path="/red/orange" component={Orange} />
        <Route path="/red/yellow" component={Yellow} />
      </div>
    );
  }
}

export default Red;
