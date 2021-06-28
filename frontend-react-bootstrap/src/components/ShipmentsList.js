import React from 'react';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import '@fortawesome/fontawesome-free-solid'

const ShipmentsList = props => {
  if (Array.isArray(props.shipments)) {
    return (
      props.shipments.map(shipment => {
        console.log('shipment:',shipment)
        return(
          <tr key={shipment.id}>
            <td>
              <Link to={"/shipments/" + shipment.shopify_id}>
                {shipment.id}
              </Link>
            </td>
            <td>{shipment.kind}</td>
            <td>
              {shipment.reference}
            </td>
            <td>{shipment.status}</td>
            <td>{shipment.total_price}</td>
            <td>{shipment.created_at}</td>
          </tr>
        )
      })
    )
  } else {
    return <div>No shipments yet</div>
  }
}

export default ShipmentsList;