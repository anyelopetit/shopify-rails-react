import React from 'react';

const OrdersList = props => {
  if (props.orders) {
    return (
      props.orders.map(order => {
        return(
          <tr>
            <td>{order.id}</td>
            <td>{order.name}</td>
          </tr>
        )
      })
    )
  } else {
    return <div>No orders yet</div>
  }
}

export default OrdersList;