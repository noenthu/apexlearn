import React from "react";
import axios from "axios";


export class Team extends React.Component {
  constructor() {
    super();
    this.state = {
      limits: [],
      orgLimits: []
    };
  }


  componentWillMount() {

  }

  componentDidMount() {
    // get session id from cookie
    //let sid = 'Bearer ' + document.cookie.match('sid=([^;]*)')[1];
    let baseUrl = document.location.origin
    let sid = __sfdcSessionId;
    //console.log(baseUrl);
    //let baseUrl = 'https://na35.salesforce.com'
    let instance = axios.create({
      baseURL: `${baseUrl}/services/data/v37.0`,
      timout: 1000,
      headers: {
        'Authorization': `Bearer ${sid}`,
        'X-PrettyPrint': 1
      }

    });
    //console.log(instance);
    console.log('the data is ' + this.state.limits);


    // get data from Apex React Controller using promises
    new Promise((resolve, reject) => {
      React_Demo_Controller.getInfo((result, event) => {
        if (event.status) {
          console.log(event.status);
          resolve(result);
        } else {
          console.log(event.message);
          reject(event.message);
        }
      });
    })
      .then((records) => {
        console.log('success');
        let locallimits = [];
        records.forEach((record) => {
          //console.log(record)
          //this.state.limits.push(record);
          locallimits.push(record);
        });
        this.setState({
          limits: locallimits
        });
      })
      .catch((error) => {
        console.log(error);
      });

    instance.get('/limits/')
      .then((response) => {
        console.log('got org limits');
        let orgLimits = [];
        orgLimits = Object.keys(response.data).map((item) => {
          let ob = {};
          ob['limitName'] = item;
          ob['max'] = response.data[item]['Max'];
          ob['remaining'] = response.data[item]['Remaining'];
          return ob;
        });

        this.setState({
          orgLimits: orgLimits
        });
      })
      .catch((error) => {
        console.log('ran into errors retrieveing org limits');
        console.log(error);
      });


      /*axios({
      method: 'get',
      url: 'https://c.na35.visual.force.com/services/data/v37.0/limits/',
      headers: {
        //'Authorization': 'Bearer <token>'
        'Authorization': `Bearer ${sid}`
      }
    })
      .then((response) => {
        console.log('success');
        console.log(response.data);
        let orgLimits = [];
        orgLimits = Object.keys(response.data).map((item) => {
          let ob = {};
          ob['limitName'] = item;
          ob['max'] = response.data[item]['Max'];
          ob['remaining'] = response.data[item]['Remaining'];
          return ob;
        });
        console.log(orgLimits);
        this.setState({
          orgLimits: orgLimits
        });

      })
      .catch((error) => {
        console.log('errors');
        console.log(error);
      });*/

  }

  //updateData(event) {
  //  event.preventDefault();
  //  console.log('updateData called new value is :' + event.target.value)
  //  this.setState({
  //    message: parseInt(event.target.value, 10)
  //  });
  //}

  //updateMessage(event) {
  //  event.preventDefault();
  //  console.log('hi in updateMessage the current message is :' + this.state.message);
  //  const nextMessage = {
  //    id: this.state.messages.length,
  //    text: this.state.message
  //  }
  //  speedRef.push(nextMessage);

  //}

  render() {

    //const currentMessage = this.state.messages.map((message, i) => {
    //  return (
    //    <li key={message.id}>{message.text}</li>
    //  );
    //})


    console.log('in render');
    //    console.log(this.state.limits);
    this.state.limits.forEach((limit) => {
      console.log('in render - forEach');
      console.log(limit);
    });
    return(
      <div className="container">
        <div className="row">
          <h3>Org Limits</h3>
          {this.state.orgLimits.map((limit, i) => {
            return(
              <p key={i}>{limit.limitName} - Remaining {limit.remaining} of Max {limit.max}</p>
            )
          })}
        </div>
        <div className="row">
          <h3>Limits</h3>
          {this.state.limits.map((limit, i) => {
            console.log(i);
            return(
              <p key={i}>{limit.limitName} - Used {limit.usedLimit} of {limit.availableLimit}</p>
            );
          })
          }
        </div>
      </div>
    );
  }
}
