import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import OrdersContainer from './containers/OrdersContainer';

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>
          <Route exact path='/' component={OrdersContainer} />
          <Route exact path='/orders' component={OrdersContainer} />
        </Switch>
      </Router>
    </div>
  );
}

export default App;
