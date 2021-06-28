import React from 'react';
import { connect } from 'react-redux';
import getOrders from '../actions/getOrders';
import OrdersTable from '../components/OrdersTable';

class OrdersContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      orders: []
    }
  }

  componentDidMount() {
    this.props.getOrders();
  }

  render() {
    if (this.props.orders) {
      return <OrdersTable orders={this.props.orders} />
    } else {
      return <h2>No orders yet.</h2>
    }
  }
}

const mapStateToProps = state => {
  return { orders: state.orders };
}

const mapDispatchToProps = dispatch => {
  return {
    getOrders: () => dispatch(getOrders())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(OrdersContainer);