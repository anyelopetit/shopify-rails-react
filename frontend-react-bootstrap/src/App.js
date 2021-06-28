import './App.css';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import AppNavbar from './components/AppNavbar';

import OrdersContainer from './containers/OrdersContainer';
import OrdersForm from './containers/OrdersForm';
import ShipmentsContainer from './containers/ShipmentsContainer'
import ProductsContainer from './containers/ProductsContainer';
import VariantsContainer from './containers/VariantsContainer'

function App() {
  return (
    <div className="App">
    <Router>
      <AppNavbar />
      <Switch>
        <Route exact path='/' component={OrdersContainer} />
        <Route exact path='/orders' component={OrdersContainer} />
        <Route exact path='/orders/new' component={OrdersForm} />
        <Route exact path='/orders/:order_id/shipments' component={ShipmentsContainer} />
        <Route exact path='/products' component={ProductsContainer} />
        <Route exact path='/products/:product_id/variants' component={VariantsContainer} />
      </Switch>
      </Router>
    </div>
  );
}

export default App;
