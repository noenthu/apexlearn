import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import { Header } from "./Header";
import { Team } from "./Team";

class App extends Component {
  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-xs-10 col-xs-offset-1">
            <Team/>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
