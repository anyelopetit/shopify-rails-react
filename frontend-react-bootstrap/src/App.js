import './App.css';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import AppNavbar from './components/AppNavbar';

import OrdersContainer from './containers/OrdersContainer';

function App() {
  return (
    <div className="App">
    <Router>
      <AppNavbar />
      <Switch>
        <Route exact path='/' component={OrdersContainer} />
        <Route exact path='/orders' component={OrdersContainer} />
      </Switch>
      </Router>
    </div>
  );
}

export default App;