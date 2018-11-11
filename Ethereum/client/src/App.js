import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import ReadString from "./ReadString";
import Header from 'app/components/header.js';

class App extends Component {
  state = {loading: false, drizzleSate: null};

  componentDidMount() {
    const { drizzle } = this.props;

    // subscribe to changes in the store
    this.unsubscribe = drizzle.store.subscribe(() => {

      // every time the store updates, grab the state from drizzle
      const drizzleState = drizzle.store.getState();

      // check to see if it's ready, if so, update local component state
      if (drizzleState.drizzleStatus.initialized) {
        this.setState({ loading: false, drizzleState });
      }
    });
  }

  compomentWillUnmount() {
    this.unsubscribe();
  }

  render() {
    if (this.state.loading) return "Loading Drizzle...";
    return (
      <div id="root" className="App">
        <head>
          <title>Lego Invest</title>
          <link href="css/bootstrap.min.css" rel="stylesheet"/>
          <link href="css/style.css" rel="stylesheet"/>
          <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400" rel="stylesheet"/>
        </head>
        <nav className="navbar navbar-light bg-light">
          <h2 className="navbar-brand" href="#">
            <img src="img/BGzf.gif" width="90px" className="d-inline-block align-top"/>
            Lego<span style="font-weight:300">invest</span>
          </h2>
        </nav>
        <ReadString
          drizzle={this.props.drizzle}
          drizzleState={this.state.drizzleState}
        />
      </div> );
  }
}

export default App;
