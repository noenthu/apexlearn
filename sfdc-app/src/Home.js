import React from "react";



export class Home extends React.Component {
  constructor() {
    super();
    this.state = {
      message: 1,
      labels: [],
      data: [],
      average: [],
      messages: []
    };
  }


  componentWillMount() {
  }

  componentDidMount() {


  }

  updateData(event) {
    event.preventDefault();
    console.log('updateData called new value is :' + event.target.value)
    this.setState({
      message: parseInt(event.target.value, 10)
    });
  }

  updateMessage(event) {
    event.preventDefault();
    console.log('hi in updateMessage the current message is :' + this.state.message);
    const nextMessage = {
      id: this.state.messages.length,
      text: this.state.message
    }

  }

  render() {
    //const currentMessages = this.state.messages;
    //const currentMessage = Object.keys(currentMessages).map((key, index) => {
    // console.log('the state messages are ' +this.state.messages);
    // console.log('the labels are' + this.state.labels);
    console.log('the data is ' + this.state.data);
    const currentMessage = this.state.messages.map((message, i) => {
      return (
        <li key={message.id}>{message.text}</li>
      );
    })

    const data= {
      labels: this.state.labels,
      datasets: [
        {
          label: "Average Confidence",
          fill: false,
          lineTension: 0.1,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgba(255, 99, 132, 0.8)',
          borderCapStyle: 'butt',
          borderDash: [],
          borderDashOffset: 0.0,
          borderJoinStyle: 'miter',
          pointBorderColor: 'rgba(255, 99, 132, 0.8)',
          pointBackgroundColor: '#fff',
          pointBorderWidth: 1,
          pointHoverRadius: 5,
          pointHoverBackgroundColor: 'rgba(255, 99, 132, 0.8)',
          pointHoverBorderColor: 'rgba(220,220,220,1)',
          pointHoverBorderWidth: 2,
          pointRadius: 3,
          pointHitRadius: 10,
          beginAtZero: true,
          data: this.state.average
        },
        {
          label: "Confidence",
          fill: true,
          lineTension: 0.1,
          backgroundColor: 'rgba(75,192,192,0.4)',
          borderColor: 'rgba(75,192,192,1)',
          borderCapStyle: 'butt',
          borderDash: [],
          borderDashOffset: 0.0,
          borderJoinStyle: 'miter',
          pointBorderColor: 'rgba(75,192,192,1)',
          pointBackgroundColor: '#fff',
          pointBorderWidth: 1,
          pointHoverRadius: 5,
          pointHoverBackgroundColor: 'rgba(75,192,192,1)',
          pointHoverBorderColor: 'rgba(220,220,220,1)',
          pointHoverBorderWidth: 2,
          pointRadius: 3,
          pointHitRadius: 10,
          beginAtZero: true,
          data: this.state.data
        }
      ]}

    return(
      <div className="container">

        <div className="form-group">
          <label>
            Confidence Level:
            <select className="form-control" value={this.state.message} onChange={this.updateData.bind(this)}>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </label>
        </div>
        <hr/>
        <button onClick={this.updateMessage.bind(this)} className="btn btn-primary">Update Data</button>
        <hr/>
      </div>
    );
  }
}
