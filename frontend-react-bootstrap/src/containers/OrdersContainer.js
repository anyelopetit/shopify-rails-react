import React from 'react';
import { connect } from 'react-redux';
import getOrders from '../actions/getOrders';

class OrdersContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      orders: []
    }
  }

  componentDidMount() {
    console.log('OrdersContainer was mounted')
    let orders = this.props.getOrders();
    console.log('orders: ', orders)
  }

  render() {
    return(
      <div>
        <h1>OrdersContainer</h1>
        if (this.props.orders.orders) {
          this.props.orders
        } else {
          <h2>No orders yet.</h2>
        }
      </div>
    )
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