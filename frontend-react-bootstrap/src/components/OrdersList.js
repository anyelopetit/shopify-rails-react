import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import '@fortawesome/fontawesome-free-solid'
import NewShipmentButton from './NewShipmentButton';

const OrdersList = props => {
  if (props.orders) {
    return (
      props.orders.map(order => {
        return(
          <tr key={order.id}>
            <td>{order.id}</td>
            <td>
              <a href={process.env.REACT_APP_SHOPIFY_ROOT + '/orders/' + order.shopify_id + '.json'} target="_blank" rel="noreferrer">
                {order.kind}
                <FontAwesomeIcon icon={['fas', "external-link-square-alt"]} className="mx-1" />
              </a>
            </td>
            <td>
              {order.reference}
            </td>
            <td>{order.status}</td>
            <td>{order.total_price} {order.currency}</td>
            <td>{order.created_at}</td>
            <td>
              <NewShipmentButton order_id={order.id} shipments={order.shipments} />
            </td>
          </tr>
        )
      })
    )
  } else {
    return <div>No orders yet</div>
  }
}

export default OrdersList;