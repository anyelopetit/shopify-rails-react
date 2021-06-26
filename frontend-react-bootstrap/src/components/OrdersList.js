import React from 'react';

const OrdersList = props => {
  if (props.orders) {
    return (
      props.orders.map(order => {
        return(
          <tr>
            <td>{order.id}</td>
            <td>{order.financial_status}</td>
            <td>{order.total_price} {order.currency}</td>
            <td>{order.created_at}</td>
          </tr>
        )
      })
    )
  } else {
    return <div>No orders yet</div>
  }
}

export default OrdersList;