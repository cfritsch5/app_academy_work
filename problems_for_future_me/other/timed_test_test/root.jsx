import React from 'react';
import App from './app';

const Root = () => {
  const thingToPassDown = "I will be available in child components";
  return (
    <div className="root">
      <h1>Rendering from Root</h1>
      <App toprop={thingToPassDown}/>
    </div>
  );
};

export default Root;
