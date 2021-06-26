import React from 'react';
import OrdersList from './OrdersList';

const OrdersTable = props => {
  if (props.orders) {
    return(
      <table>
        <thead>
          <th>ID</th>
        </thead>
        <tbody>
          <OrdersList orders={props.orders} />
        </tbody>
      </table>
    )
  } else {
    return <div>No orders yet</div>
  }
}

export default OrdersTable;