import React from 'react';
import ReactDOM from 'react-dom';
//import { BrowserRouter, Match, Miss } from 'react-router';
import App from './App';
//import TeamSelection from './TeamSelection';
//import NotFound from './NotFound';
import './index.css';

/*const Root = () => {
  return (
    <BrowserRouter>
      <div>
        <Match exactly pattern="/" component={App} />
        <Match pattern="/team/:teamId/pi/:pi" component={TeamSelection} />
        <Miss component={NotFound} />
      </div>
    </BrowserRouter>
  )
}*/

ReactDOM.render(
  <App/>,
  document.getElementById('root')
);
